import 'package:flutter_test/flutter_test.dart';
import 'package:hananote/core/error/failures.dart';

void main() {
  group('Failure sealed class', () {
    test('should match correct type for DatabaseFailure', () {
      const failure = Failure.database(message: 'db error');

      final result = switch (failure) {
        DatabaseFailure() => 'database',
        CryptoFailure() => 'crypto',
        StorageFailure() => 'storage',
        AuthFailure() => 'auth',
        ValidationFailure() => 'validation',
        UnexpectedFailure() => 'unexpected',
      };

      expect(result, 'database');
    });

    test('should match correct type for CryptoFailure', () {
      const failure = Failure.crypto(message: 'crypto error');

      final result = switch (failure) {
        DatabaseFailure() => 'database',
        CryptoFailure() => 'crypto',
        StorageFailure() => 'storage',
        AuthFailure() => 'auth',
        ValidationFailure() => 'validation',
        UnexpectedFailure() => 'unexpected',
      };

      expect(result, 'crypto');
    });
  });
}
