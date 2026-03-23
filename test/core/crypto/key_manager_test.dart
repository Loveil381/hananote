import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hananote/core/crypto/key_manager.dart';
import 'package:mocktail/mocktail.dart';

class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}

void main() {
  late KeyManager keyManager;
  late MockFlutterSecureStorage mockSecureStorage;
  
  // Custom in-memory storage for test
  final inMemoryStorage = <String, String>{};

  setUp(() {
    mockSecureStorage = MockFlutterSecureStorage();
    keyManager = KeyManager(mockSecureStorage);
    inMemoryStorage.clear();

    // Setup mocks
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

    test('should initialize key and save to secure storage', () async {
      await keyManager.initializeKey(password);

      expect(inMemoryStorage.containsKey('hananote_salt'), isTrue);
      expect(inMemoryStorage.containsKey('hananote_master_key'), isTrue);

      verify(
        () => mockSecureStorage.write(
          key: 'hananote_salt',
          value: any(named: 'value'),
        ),
      ).called(1);
      verify(
        () => mockSecureStorage.write(
          key: 'hananote_master_key',
          value: any(named: 'value'),
        ),
      ).called(1);
    });

    test('should retrieve initialized key successfully', () async {
      await keyManager.initializeKey(password);
      final key = await keyManager.getKey();

      expect(key, isNotNull);
      expect(key!.length, 32); // 256 bits
    });

    test(
      'should return null when getting key without initialization',
      () async {
        final key = await keyManager.getKey();
        expect(key, isNull);
      },
    );

    test('should verify correct password', () async {
      await keyManager.initializeKey(password);
      final isValid = await keyManager.verifyPassword(password);

      expect(isValid, isTrue);
    });

    test('should reject wrong password', () async {
      await keyManager.initializeKey(password);
      final isValid = await keyManager.verifyPassword('wrongPassword!');

      expect(isValid, isFalse);
    });

    test('should delete key correctly', () async {
      await keyManager.initializeKey(password);
      await keyManager.deleteKey();

      expect(inMemoryStorage.isEmpty, isTrue);
      final key = await keyManager.getKey();
      expect(key, isNull);
    });
  });
}
