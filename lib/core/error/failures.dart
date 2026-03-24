import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

/// Base failure type for the application.
/// Uses sealed class for exhaustive pattern matching.
@freezed
sealed class Failure with _$Failure {
  /// Database operation failed.
  const factory Failure.database({required String message}) = DatabaseFailure;

  /// Encryption/decryption operation failed.
  const factory Failure.crypto({required String message}) = CryptoFailure;

  /// File system operation failed.
  const factory Failure.storage({required String message}) = StorageFailure;

  /// Authentication failed (wrong PIN, biometric failure).
  const factory Failure.auth({required String message}) = AuthFailure;

  /// Data validation failed.
  const factory Failure.validation({required String message}) =
      ValidationFailure;

  /// Unexpected error.
  const factory Failure.unexpected({required String message}) =
      UnexpectedFailure;
}

/// Extracts the human-readable [message] from any [Failure] variant.
String failureMessage(Failure failure) => switch (failure) {
      DatabaseFailure(:final message) => message,
      CryptoFailure(:final message) => message,
      StorageFailure(:final message) => message,
      AuthFailure(:final message) => message,
      ValidationFailure(:final message) => message,
      UnexpectedFailure(:final message) => message,
    };
