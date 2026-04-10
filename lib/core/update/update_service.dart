import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

/// Information about an available app update.
class AppUpdateInfo {
  /// Creates an [AppUpdateInfo].
  const AppUpdateInfo({
    required this.latestVersion,
    required this.downloadUrl,
    required this.releaseNotes,
    required this.htmlUrl,
  });

  /// The latest version tag (e.g. "1.1.0").
  final String latestVersion;

  /// Direct download URL of the APK asset.
  final String? downloadUrl;

  /// Markdown release notes body.
  final String releaseNotes;

  /// GitHub release page URL (fallback for download).
  final String htmlUrl;
}

/// Checks GitHub Releases for app updates.
class UpdateService {
  /// GitHub owner/repo for this project.
  static const _owner = 'Loveil381';
  static const _repo = 'hananote';

  /// Checks whether a newer version is available.
  ///
  /// Returns [AppUpdateInfo] if an update exists, `null` otherwise.
  /// Silently returns `null` on any network or parsing error.
  static Future<AppUpdateInfo?> checkForUpdate(String currentVersion) async {
    try {
      final response = await http
          .get(
            Uri.parse(
              'https://api.github.com/repos/$_owner/$_repo/releases/latest',
            ),
            headers: {'Accept': 'application/vnd.github.v3+json'},
          )
          .timeout(const Duration(seconds: 10));

      if (response.statusCode != 200) return null;

      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final tagName = (data['tag_name'] as String? ?? '').replaceAll('v', '');

      if (!_isNewer(tagName, currentVersion)) return null;

      // Find the APK asset if present.
      String? apkUrl;
      final assets = data['assets'] as List<dynamic>? ?? [];
      for (final asset in assets) {
        final name = asset['name'] as String? ?? '';
        if (name.endsWith('.apk')) {
          apkUrl = asset['browser_download_url'] as String?;
          break;
        }
      }

      return AppUpdateInfo(
        latestVersion: tagName,
        downloadUrl: apkUrl,
        releaseNotes: data['body'] as String? ?? '',
        htmlUrl: data['html_url'] as String? ?? '',
      );
    } catch (e) {
      debugPrint('[UpdateService] Check failed: $e');
      return null;
    }
  }

  /// Compares two semver strings. Returns true if [remote] > [local].
  static bool _isNewer(String remote, String local) {
    final remoteParts = remote.split('.').map(int.tryParse).toList();
    final localParts = local.split('.').map(int.tryParse).toList();

    for (var i = 0; i < 3; i++) {
      final r = i < remoteParts.length ? (remoteParts[i] ?? 0) : 0;
      final l = i < localParts.length ? (localParts[i] ?? 0) : 0;
      if (r > l) return true;
      if (r < l) return false;
    }
    return false;
  }
}
