import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as p;

void main() {
  const requiredKeys = <String>{
    'photoGallery',
    'addPhoto',
    'photoEmptyTitle',
    'photoEmptyDescription',
    'photoDeleteTitle',
    'photoDeleteMessage',
    'takePhoto',
    'chooseFromLibrary',
    'errorFallbackTitle',
    'errorFallbackDescription',
    'retry',
    'cancel',
    'delete',
  };

  Map<String, Object?> readArb(String fileName) {
    final path = p.join(
      Directory.current.path,
      'lib',
      'core',
      'l10n',
      'arb',
      fileName,
    );
    return jsonDecode(File(path).readAsStringSync()) as Map<String, Object?>;
  }

  Set<String> publicKeys(Map<String, Object?> arb) =>
      arb.keys.where((key) => !key.startsWith('@')).toSet();

  test('app_en.arb defines all required photo and fallback keys', () {
    final arb = readArb('app_en.arb');

    expect(publicKeys(arb), containsAll(requiredKeys));
  });

  test('app_zh.arb defines all required photo and fallback keys', () {
    final arb = readArb('app_zh.arb');

    expect(publicKeys(arb), containsAll(requiredKeys));
  });

  test('all locale arb files expose the same public key set', () {
    final englishKeys = publicKeys(readArb('app_en.arb'));

    expect(publicKeys(readArb('app_zh.arb')), englishKeys);
    expect(publicKeys(readArb('app_ja.arb')), englishKeys);
  });
}
