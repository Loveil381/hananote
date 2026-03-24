// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:hananote/app/di/register_module.dart' as _i622;
import 'package:hananote/core/crypto/crypto_engine.dart' as _i472;
import 'package:hananote/core/crypto/key_manager.dart' as _i869;
import 'package:hananote/core/database/secure_database.dart' as _i59;
import 'package:hananote/features/auth/data/datasources/auth_local_datasource.dart'
    as _i260;
import 'package:hananote/features/auth/data/repositories/auth_repository_impl.dart'
    as _i735;
import 'package:hananote/features/auth/domain/repositories/auth_repository.dart'
    as _i1072;
import 'package:hananote/features/auth/domain/usecases/change_pin.dart'
    as _i465;
import 'package:hananote/features/auth/domain/usecases/setup_app.dart' as _i909;
import 'package:hananote/features/auth/domain/usecases/unlock_app.dart'
    as _i177;
import 'package:hananote/features/auth/domain/usecases/wipe_data.dart' as _i69;
import 'package:hananote/features/auth/presentation/bloc/auth_cubit.dart'
    as _i464;
import 'package:hananote/features/medication/data/datasources/medication_local_datasource.dart'
    as _i1047;
import 'package:hananote/features/medication/data/repositories/medication_repository_impl.dart'
    as _i1024;
import 'package:hananote/features/medication/domain/repositories/medication_repository.dart'
    as _i160;
import 'package:injectable/injectable.dart' as _i526;
import 'package:local_auth/local_auth.dart' as _i152;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i558.FlutterSecureStorage>(
        () => registerModule.secureStorage);
    gh.lazySingleton<_i152.LocalAuthentication>(
        () => registerModule.localAuthentication);
    gh.lazySingleton<_i472.CryptoEngine>(() => _i472.CryptoEngine());
    gh.lazySingleton<_i869.KeyManager>(
        () => _i869.KeyManager(gh<_i558.FlutterSecureStorage>()));
    gh.lazySingleton<_i260.AuthLocalDataSource>(
        () => _i260.AuthLocalDataSourceImpl(gh<_i558.FlutterSecureStorage>()));
    gh.lazySingleton<_i59.SecureDatabase>(
        () => _i59.SecureDatabase(gh<_i869.KeyManager>()));
    gh.lazySingleton<_i1072.AuthRepository>(() => _i735.AuthRepositoryImpl(
          gh<_i260.AuthLocalDataSource>(),
          gh<_i869.KeyManager>(),
          gh<_i59.SecureDatabase>(),
          gh<_i558.FlutterSecureStorage>(),
          gh<_i152.LocalAuthentication>(),
        ));
    gh.lazySingleton<_i1047.MedicationLocalDataSource>(
        () => _i1047.MedicationLocalDataSourceImpl(gh<_i59.SecureDatabase>()));
    gh.factory<_i465.ChangePin>(
        () => _i465.ChangePin(gh<_i1072.AuthRepository>()));
    gh.factory<_i909.SetupApp>(
        () => _i909.SetupApp(gh<_i1072.AuthRepository>()));
    gh.factory<_i177.UnlockApp>(
        () => _i177.UnlockApp(gh<_i1072.AuthRepository>()));
    gh.factory<_i69.WipeData>(() => _i69.WipeData(gh<_i1072.AuthRepository>()));
    gh.factory<_i464.AuthCubit>(() => _i464.AuthCubit(
          gh<_i1072.AuthRepository>(),
          gh<_i909.SetupApp>(),
          gh<_i177.UnlockApp>(),
          gh<_i69.WipeData>(),
        ));
    gh.lazySingleton<_i160.MedicationRepository>(() =>
        _i1024.MedicationRepositoryImpl(
            gh<_i1047.MedicationLocalDataSource>()));
    return this;
  }
}

class _$RegisterModule extends _i622.RegisterModule {}
