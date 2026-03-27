import 'package:hananote/core/error/failures.dart';

/// Convenience extension to extract the human-readable message from any
/// [Failure] variant without pattern-matching at every call site.
extension FailureX on Failure {
  /// Returns the human-readable error message from any [Failure] variant.
  String get message => switch (this) {
        DatabaseFailure(:final message) => message,
        CryptoFailure(:final message) => message,
        StorageFailure(:final message) => message,
        AuthFailure(:final message) => message,
        NotificationFailure(:final message) => message,
        ValidationFailure(:final message) => message,
        UnexpectedFailure(:final message) => message,
      };
}
