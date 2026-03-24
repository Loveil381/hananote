import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/features/medication/domain/entities/drug.dart';
import 'package:hananote/features/medication/domain/usecases/add_drug.dart';
import 'package:hananote/features/medication/domain/usecases/delete_drug.dart';
import 'package:hananote/features/medication/domain/usecases/get_all_drugs.dart';
import 'package:hananote/features/medication/domain/usecases/update_drug.dart';
import 'package:hananote/features/medication/presentation/bloc/drug_list_state.dart';

/// Manages the full list of drugs.
///
/// Exposes load, add, update, delete, and toggle-active operations.
/// Every mutating operation automatically reloads the list on success.
class DrugListCubit extends Cubit<DrugListState> {
  /// Creates a [DrugListCubit].
  DrugListCubit(
    this._getAllDrugs,
    this._addDrug,
    this._updateDrug,
    this._deleteDrug,
  ) : super(const DrugListState.initial());

  final GetAllDrugs _getAllDrugs;
  final AddDrug _addDrug;
  final UpdateDrug _updateDrug;
  final DeleteDrug _deleteDrug;

  /// Loads all drugs from the repository.
  Future<void> loadDrugs() async {
    emit(const DrugListState.loading());
    final result = await _getAllDrugs();
    result.fold(
      (failure) => emit(DrugListState.error(message: failureMessage(failure))),
      (drugs) => emit(DrugListState.loaded(drugs: drugs)),
    );
  }

  /// Adds [drug] and reloads the list on success.
  Future<void> addDrug(Drug drug) async {
    final result = await _addDrug(drug);
    await result.fold(
      (failure) async =>
          emit(DrugListState.error(message: failureMessage(failure))),
      (_) async => loadDrugs(),
    );
  }

  /// Updates [drug] and reloads the list on success.
  Future<void> updateDrug(Drug drug) async {
    final result = await _updateDrug(drug);
    await result.fold(
      (failure) async =>
          emit(DrugListState.error(message: failureMessage(failure))),
      (_) async => loadDrugs(),
    );
  }

  /// Deletes the drug with [id] and reloads the list on success.
  Future<void> deleteDrug(String id) async {
    final result = await _deleteDrug(id);
    await result.fold(
      (failure) async =>
          emit(DrugListState.error(message: failureMessage(failure))),
      (_) async => loadDrugs(),
    );
  }

  /// Flips [drug]'s [Drug.isActive] flag and reloads on success.
  Future<void> toggleDrugActive(Drug drug) =>
      updateDrug(drug.copyWith(isActive: !drug.isActive));
}
