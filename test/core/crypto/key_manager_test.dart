import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hananote/core/crypto/key_manager.dart';
import 'package:mocktail/mocktail.dart';

class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}

void main() {
  late KeyManager keyManager;
  late MockFlutterSecureStorage mockSecureStorage;
  final inMemoryStorage = <String, String>{};

  setUp(() {
    mockSecureStorage = MockFlutterSecureStorage();
    keyManager = KeyManager(mockSecureStorage);
    inMemoryStorage.clear();

    when(
      () => mockSecureStorage.write(
        key: any(named: 'key'),
        value: any(named: 'value'),
      ),
    ).thenAnswer((invocation) async {
      final key = invocation.namedArguments[#key] as String;
      final value = invocation.namedArguments[#value] as String?;
      if (value != null) {
        inMemoryStorage[key] = value;
      }
    });

    when(() => mockSecureStorage.read(key: any(named: 'key'))).thenAnswer((
      invocation,
    ) async {
      final key = invocation.namedArguments[#key] as String;
      return inMemoryStorage[key];
    });

    when(() => mockSecureStorage.delete(key: any(named: 'key'))).thenAnswer((
      invocation,
    ) async {
      final key = invocation.namedArguments[#key] as String;
      inMemoryStorage.remove(key);
    });
  });

  group('KeyManager', () {
    const password = 'mySuperStrongPassword123';

    test('initializeKey then getKey should return a 32-byte key', () async {
      await keyManager.initializeKey(password);
      final key = await keyManager.getKey();

      expect(key, isNotNull);
      expect(key, hasLength(32));
    });

    test('verifyPassword should return true for the correct password',
        () async {
      await keyManager.initializeKey(password);
      final isValid = await keyManager.verifyPassword(password);

      expect(isValid, isTrue);
    });

    test('verifyPassword should return false for a wrong password', () async {
      await keyManager.initializeKey(password);
      final isValid = await keyManager.verifyPassword('wrongPassword!');

      expect(isValid, isFalse);
    });

    test('deleteKey then getKey should return null', () async {
      await keyManager.initializeKey(password);
      await keyManager.deleteKey();

      final key = await keyManager.getKey();
      expect(key, isNull);
    });
  });
}
