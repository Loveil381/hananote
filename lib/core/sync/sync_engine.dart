// HanaNote v2 — Sync engine.
// Orchestrates push/pull cycles between local SQLCipher records and
// Supabase encrypted_records via E2EE codec + Edge Functions.
//
// Public API:
//   - `pushPending()` — encrypts and POSTs `/sync-push`.
//   - `pullSince(DateTime)` — POSTs `/sync-pull`, decrypts, applies.
//   - `runOnce()` — both, in order.
//
// The actual local DB read/write is delegated to a `SyncQueue`
// abstract — feature blocs register tables they want synced.
//
// TODO(R52-hardening, 铁律 #14):
//   - Conflict resolution is currently last-write-wins by updated_at.
//     Need vector-clock support if R53 adds simultaneous edits.
//   - Backoff + retry on transient network failures (currently
//     surfaces error to the bloc).
//
// ignore_for_file: public_member_api_docs

import 'dart:async';
import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/auth/supabase_client.dart';
import 'package:hananote/core/sync/e2ee_codec.dart';
import 'package:hananote/core/sync/sync_queue.dart';

sealed class SyncFailure {
  const SyncFailure(this.message);
  final String message;
}

class SyncDisabled extends SyncFailure {
  const SyncDisabled() : super('cloud sync disabled');
}

class SyncNetwork extends SyncFailure {
  const SyncNetwork(super.message);
}

class SyncCryptoFailed extends SyncFailure {
  const SyncCryptoFailed(super.message);
}

class SyncEngine {
  SyncEngine({required E2eeCodec codec, required SyncQueue queue})
      : _codec = codec,
        _queue = queue;

  final E2eeCodec _codec;
  final SyncQueue _queue;

  /// Push all pending dirty records. Returns Right(count).
  Future<Either<SyncFailure, int>> pushPending() async {
    if (!HanaSupabase.isConfigured) return const Left(SyncDisabled());
    try {
      final dirty = await _queue.takeDirty();
      if (dirty.isEmpty) return const Right(0);

      final body = dirty.map((r) {
        final blob = _codec.encode(r.payload);
        return {
          'id': r.id,
          'kind': r.kind,
          'device_id': r.deviceId,
          'occurred_at': r.occurredAt?.toIso8601String(),
          'client_version': r.clientVersion,
          'ciphertext_b64': base64Encode(blob.ciphertext),
          'nonce_b64': base64Encode(blob.nonce),
        };
      }).toList();

      final res = await HanaSupabase.client.functions.invoke(
        'sync-push',
        body: {'records': body},
      );
      final accepted = (res.data as Map<String, dynamic>)['accepted'] as int;
      await _queue.markClean(dirty.map((r) => r.id).toList());
      return Right(accepted);
    } catch (e) {
      return Left(SyncNetwork('$e'));
    }
  }

  /// Pull updates since [since] and apply locally.
  Future<Either<SyncFailure, DateTime>> pullSince(DateTime since) async {
    if (!HanaSupabase.isConfigured) return const Left(SyncDisabled());
    try {
      final res = await HanaSupabase.client.functions.invoke(
        'sync-pull',
        body: {'since': since.toIso8601String(), 'limit': 500},
      );
      final body = res.data as Map<String, dynamic>;
      final records = (body['records'] as List<dynamic>);
      final nextSince = DateTime.parse(body['next_since'] as String);

      for (final r in records) {
        final m = r as Map<String, dynamic>;
        try {
          final payload = _codec.decode(EncryptedBlob(
            ciphertext: base64Decode(m['ciphertext_b64'] as String),
            nonce: base64Decode(m['nonce_b64'] as String),
          ));
          await _queue.applyRemote(SyncedRecord(
            id: m['id'] as String,
            kind: m['kind'] as String,
            deviceId: m['device_id'] as String?,
            occurredAt: m['occurred_at'] == null
                ? null
                : DateTime.parse(m['occurred_at'] as String),
            clientVersion: m['client_version'] as String?,
            payload: payload,
          ));
        } catch (e) {
          return Left(SyncCryptoFailed('decrypt failed for ${m['id']}: $e'));
        }
      }
      return Right(nextSince);
    } catch (e) {
      return Left(SyncNetwork('$e'));
    }
  }

  /// Convenience: push, then pull-since-last.
  Future<Either<SyncFailure, void>> runOnce(DateTime since) async {
    final pushRes = await pushPending();
    if (pushRes.isLeft()) {
      return pushRes.fold((l) => Left(l), (_) => const Right(null));
    }
    final pullRes = await pullSince(since);
    return pullRes.fold((l) => Left(l), (_) => const Right(null));
  }
}
