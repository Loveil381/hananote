import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

/// Deletes all secure app data.
@injectable
class WipeData {
  /// Creates [WipeData].
  WipeData(this._repository);

  final AuthRepository _repository;

  /// Executes the use case.
  Future<Either<Failure, void>> call() => _repository.deleteAllData();
}
