import 'package:flutter_test/flutter_test.dart';
import 'package:hananote/core/utils/id_generator.dart';

void main() {
  group('IdGenerator', () {
    test('generates a hex string of the expected length', () {
      final id = IdGenerator.generate();

      expect(id.length, 32);
      expect(RegExp(r'^[0-9a-f]+$').hasMatch(id), isTrue);
    });

    test('generates distinct IDs', () {
      final first = IdGenerator.generate();
      final second = IdGenerator.generate();

      expect(first, isNot(equals(second)));
    });
  });
}
