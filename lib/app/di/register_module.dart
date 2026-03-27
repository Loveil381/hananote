// Release prep note: App-only DI wiring stays undocumented to avoid noisy
// dartdoc on internal registration helpers.
// ignore_for_file: public_member_api_docs

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();

  @lazySingleton
  LocalAuthentication get localAuthentication => LocalAuthentication();
}
