import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

/// Unlocks the app with a PIN.
@injectable
class UnlockApp {
  /// Creates [UnlockApp].
  UnlockApp(this._repository);

  final AuthRepository _repository;

  /// Executes the use case.
  Future<Either<Failure, bool>> call(String pin) async {
    if (!RegExp(r'^\d{6}$').hasMatch(pin)) {
      return right(false);
    }

    final verifyResult = await _repository.verifyPassword(pin);
    if (verifyResult.isLeft()) {
      return verifyResult;
    }

    final isValid = verifyResult.getOrElse((_) => false);
    if (!isValid) {
      return right(false);
    }

    final openResult = await _repository.openDatabase();
    if (openResult.isLeft()) {
      return openResult.fold(left, (_) => right(false));
    }

    return right(true);
  }
}
