import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/settings/domain/entities/app_settings.dart';
import 'package:hananote/features/settings/domain/repositories/settings_repository.dart';
import 'package:injectable/injectable.dart';

/// Persists app settings changes.
@injectable
class UpdateAppSettings {
  /// Creates an [UpdateAppSettings].
  UpdateAppSettings(this._repository);

  final SettingsRepository _repository;

  /// Executes the use case.
  Future<Either<Failure, AppSettings>> call(AppSettings settings) {
    return _repository.saveAppSettings(settings);
  }
}
