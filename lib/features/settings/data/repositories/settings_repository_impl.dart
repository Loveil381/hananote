import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/auth/domain/repositories/auth_repository.dart';
import 'package:hananote/features/settings/data/datasources/settings_local_datasource.dart';
import 'package:hananote/features/settings/domain/entities/app_settings.dart';
import 'package:hananote/features/settings/domain/entities/user_profile.dart';
import 'package:hananote/features/settings/domain/repositories/settings_repository.dart';
import 'package:injectable/injectable.dart';

/// Repository implementation for profile and settings data.
@LazySingleton(as: SettingsRepository)
class SettingsRepositoryImpl implements SettingsRepository {
  /// Creates a [SettingsRepositoryImpl].
  SettingsRepositoryImpl(this._localDataSource, this._authRepository);

  final SettingsLocalDataSource _localDataSource;
  final AuthRepository _authRepository;

  static final DateTime _defaultHrtStartDate = DateTime(2025, 11, 30);

  @override
  Future<Either<Failure, UserProfile>> getUserProfile() {
    return _guardStorage(() async {
      final storedProfile = await _localDataSource.getUserProfile();
      if (storedProfile == null) {
        return _defaultProfile();
      }

      return storedProfile.copyWith(
        hrtDayCount: _calculateHrtDayCount(storedProfile.hrtStartDate),
      );
    });
  }

  @override
  Future<Either<Failure, UserProfile>> saveUserProfile(UserProfile profile) {
    return _guardStorage(() async {
      final normalizedProfile = profile.copyWith(
        hrtDayCount: _calculateHrtDayCount(profile.hrtStartDate),
      );
      await _localDataSource.saveUserProfile(normalizedProfile);
      return normalizedProfile;
    });
  }

  @override
  Future<Either<Failure, AppSettings>> getAppSettings() {
    return _guardStorage(() async {
      return await _localDataSource.getAppSettings() ?? _defaultAppSettings();
    });
  }

  @override
  Future<Either<Failure, AppSettings>> saveAppSettings(AppSettings settings) {
    return _guardStorage(() async {
      await _localDataSource.saveAppSettings(settings);
      return settings;
    });
  }

  @override
  Future<Either<Failure, int>> getActiveDrugCount() {
    return _guardDatabase(_localDataSource.getActiveDrugCount);
  }

  @override
  Future<Either<Failure, int?>> getInventoryDaysRemaining() {
    return _guardDatabase(_localDataSource.getInventoryDaysRemaining);
  }

  @override
  Future<Either<Failure, void>> wipeAllData() {
    return _authRepository.deleteAllData();
  }

  UserProfile _defaultProfile() {
    return UserProfile(
      displayName: '小花',
      hrtDayCount: _calculateHrtDayCount(_defaultHrtStartDate),
      hrtStartDate: _defaultHrtStartDate,
    );
  }

  AppSettings _defaultAppSettings() {
    return const AppSettings(
      appLockEnabled: true,
      privacyModeEnabled: false,
      blurOverlayEnabled: true,
      lastBackupDate: null,
    );
  }

  int _calculateHrtDayCount(DateTime hrtStartDate) {
    final today = DateTime.now();
    final startDate = DateTime(
      hrtStartDate.year,
      hrtStartDate.month,
      hrtStartDate.day,
    );
    final normalizedToday = DateTime(today.year, today.month, today.day);
    final difference = normalizedToday.difference(startDate).inDays;
    return difference < 0 ? 0 : difference;
  }

  Future<Either<Failure, T>> _guardStorage<T>(
    Future<T> Function() action,
  ) async {
    try {
      return right(await action());
    } catch (error) {
      return left(Failure.storage(message: error.toString()));
    }
  }

  Future<Either<Failure, T>> _guardDatabase<T>(
    Future<T> Function() action,
  ) async {
    try {
      return right(await action());
    } catch (error) {
      return left(Failure.database(message: error.toString()));
    }
  }
}
