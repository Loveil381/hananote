import 'dart:math';

/// Generates cryptographically secure random hex IDs.
abstract final class IdGenerator {
  /// Generates a random hexadecimal identifier.
  static String generate({int bytes = 16}) {
    final random = Random.secure();
    return List.generate(bytes, (_) => random.nextInt(256))
        .map((b) => b.toRadixString(16).padLeft(2, '0'))
        .join();
  }
}
