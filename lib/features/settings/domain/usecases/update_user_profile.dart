import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/settings/domain/entities/user_profile.dart';
import 'package:hananote/features/settings/domain/repositories/settings_repository.dart';
import 'package:injectable/injectable.dart';

/// Use case for updating the user profile.
@injectable
class UpdateUserProfile {
  /// Creates an [UpdateUserProfile].
  const UpdateUserProfile(this._repository);

  final SettingsRepository _repository;

  /// Executes the use case.
  Future<Either<Failure, UserProfile>> call(UserProfile profile) {
    return _repository.saveUserProfile(profile);
  }
}
