import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

/// Changes the app PIN.
@injectable
class ChangePin {
  /// Creates [ChangePin].
  ChangePin(this._repository);

  final AuthRepository _repository;

  /// Executes the use case.
  Future<Either<Failure, void>> call(String oldPin, String newPin) async {
    if (!RegExp(r'^\d{6}$').hasMatch(newPin)) {
      return left(
        const Failure.validation(message: 'PIN must be exactly 6 digits.'),
      );
    }

    final verifyResult = await _repository.verifyPassword(oldPin);
    if (verifyResult.isLeft()) {
      return verifyResult.fold(left, (_) => right(null));
    }

    if (!verifyResult.getOrElse((_) => false)) {
      return left(const Failure.auth(message: 'Current PIN is incorrect.'));
    }

    return _repository.changePassword(oldPin, newPin);
  }
}
