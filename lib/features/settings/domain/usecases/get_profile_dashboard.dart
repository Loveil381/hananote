import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/settings/domain/entities/app_settings.dart';
import 'package:hananote/features/settings/domain/entities/user_profile.dart';
import 'package:hananote/features/settings/domain/repositories/settings_repository.dart';
import 'package:injectable/injectable.dart';

/// Composite profile dashboard payload.
typedef ProfileDashboard = ({
  UserProfile profile,
  AppSettings settings,
  int activeDrugCount,
  int? inventoryDaysRemaining,
});

class _ProfileDashboardFailure implements Exception {
  const _ProfileDashboardFailure(this.failure);

  final Failure failure;
}

/// Loads the settings dashboard data in one request.
@injectable
class GetProfileDashboard {
  /// Creates a [GetProfileDashboard].
  GetProfileDashboard(this._repository);

  final SettingsRepository _repository;

  /// Executes the use case.
  Future<Either<Failure, ProfileDashboard>> call() async {
    try {
      final profile = _unwrap(await _repository.getUserProfile());
      final settings = _unwrap(await _repository.getAppSettings());
      final activeDrugCount = _unwrap(await _repository.getActiveDrugCount());
      final inventoryDaysRemaining =
          _unwrap(await _repository.getInventoryDaysRemaining());

      return right(
        (
          profile: profile,
          settings: settings,
          activeDrugCount: activeDrugCount,
          inventoryDaysRemaining: inventoryDaysRemaining,
        ),
      );
    } on _ProfileDashboardFailure catch (error) {
      return left(
        error.failure,
      );
    }
  }

  T _unwrap<T>(Either<Failure, T> result) {
    return result.fold(
      (failure) => throw _ProfileDashboardFailure(failure),
      (value) => value,
    );
  }
}
