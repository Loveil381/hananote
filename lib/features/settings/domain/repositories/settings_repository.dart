import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/settings/domain/entities/app_settings.dart';
import 'package:hananote/features/settings/domain/entities/user_profile.dart';

/// Contract for profile and settings data.
abstract interface class SettingsRepository {
  /// Returns the persisted user profile.
  Future<Either<Failure, UserProfile>> getUserProfile();

  /// Persists and returns [profile].
  Future<Either<Failure, UserProfile>> saveUserProfile(UserProfile profile);

  /// Returns the persisted app settings.
  Future<Either<Failure, AppSettings>> getAppSettings();

  /// Persists and returns [settings].
  Future<Either<Failure, AppSettings>> saveAppSettings(AppSettings settings);

  /// Returns the number of active drugs.
  Future<Either<Failure, int>> getActiveDrugCount();

  /// Returns the minimum remaining inventory days across active drugs.
  Future<Either<Failure, int?>> getInventoryDaysRemaining();

  /// Wipes all protected app data.
  Future<Either<Failure, void>> wipeAllData();
}
