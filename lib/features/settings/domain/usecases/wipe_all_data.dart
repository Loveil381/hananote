import 'package:fpdart/fpdart.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/settings/domain/repositories/settings_repository.dart';
import 'package:injectable/injectable.dart';

/// Wipes all protected application data.
@injectable
class WipeAllData {
  /// Creates a [WipeAllData].
  WipeAllData(this._repository);

  final SettingsRepository _repository;

  /// Executes the use case.
  Future<Either<Failure, void>> call() {
    return _repository.wipeAllData();
  }
}
