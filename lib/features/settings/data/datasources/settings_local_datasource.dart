import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/medication/data/datasources/medication_local_datasource.dart';
import 'package:hananote/features/medication/domain/repositories/medication_repository.dart';
import 'package:hananote/features/settings/domain/entities/app_settings.dart';
import 'package:hananote/features/settings/domain/entities/user_profile.dart';
import 'package:injectable/injectable.dart';

/// Local secure-storage persistence for profile and app settings.
abstract interface class SettingsLocalDataSource {
  /// Returns the stored profile, if one exists.
  Future<UserProfile?> getUserProfile();

  /// Persists [profile].
  Future<void> saveUserProfile(UserProfile profile);

  /// Returns the stored app settings, if any.
  Future<AppSettings?> getAppSettings();

  /// Persists [settings].
  Future<void> saveAppSettings(AppSettings settings);

  /// Returns the number of active drugs.
  Future<int> getActiveDrugCount();

  /// Returns the minimum days-until-empty across active drugs.
  Future<int?> getInventoryDaysRemaining();
}

/// Secure-storage-backed implementation of [SettingsLocalDataSource].
@LazySingleton(as: SettingsLocalDataSource)
class SettingsLocalDataSourceImpl implements SettingsLocalDataSource {
  /// Creates a [SettingsLocalDataSourceImpl].
  SettingsLocalDataSourceImpl(
    this._secureStorage,
    this._medicationLocalDataSource,
    this._medicationRepository,
  );

  final FlutterSecureStorage _secureStorage;
  final MedicationLocalDataSource _medicationLocalDataSource;
  final MedicationRepository _medicationRepository;

  static const String _userProfileKey = 'user_profile';
  static const String _appSettingsKey = 'app_settings';

  @override
  Future<UserProfile?> getUserProfile() async {
    final raw = await _secureStorage.read(key: _userProfileKey);
    if (raw == null) {
      return null;
    }

    return UserProfile.fromJson(jsonDecode(raw) as Map<String, dynamic>);
  }

  @override
  Future<void> saveUserProfile(UserProfile profile) {
    return _secureStorage.write(
      key: _userProfileKey,
      value: jsonEncode(profile.toJson()),
    );
  }

  @override
  Future<AppSettings?> getAppSettings() async {
    final raw = await _secureStorage.read(key: _appSettingsKey);
    if (raw == null) {
      return null;
    }

    return AppSettings.fromJson(jsonDecode(raw) as Map<String, dynamic>);
  }

  @override
  Future<void> saveAppSettings(AppSettings settings) {
    return _secureStorage.write(
      key: _appSettingsKey,
      value: jsonEncode(settings.toJson()),
    );
  }

  @override
  Future<int> getActiveDrugCount() async {
    final drugs = await _medicationLocalDataSource.getAllDrugs();
    return drugs.where((drug) => drug.toDomain().isActive).length;
  }

  @override
  Future<int?> getInventoryDaysRemaining() async {
    final drugs = await _medicationLocalDataSource.getAllDrugs();
    final activeDrugIds =
        drugs.where((drug) => drug.toDomain().isActive).map((drug) => drug.id);

    int? minimumDaysRemaining;
    for (final drugId in activeDrugIds) {
      final daysResult = await _medicationRepository.getDaysUntilEmpty(drugId);
      final daysRemaining = daysResult.fold<int?>(
        (failure) => throw StateError(failureMessage(failure)),
        (days) => days,
      );

      if (daysRemaining == null) {
        continue;
      }

      minimumDaysRemaining = minimumDaysRemaining == null
          ? daysRemaining
          : minimumDaysRemaining < daysRemaining
              ? minimumDaysRemaining
              : daysRemaining;
    }

    return minimumDaysRemaining;
  }
}
