import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hananote/features/medication/domain/entities/drug.dart';

part 'drug_list_state.freezed.dart';

/// States for `DrugListCubit`.
@freezed
sealed class DrugListState with _$DrugListState {
  /// Not yet loaded.
  const factory DrugListState.initial() = DrugListInitial;

  /// Fetching drugs from the repository.
  const factory DrugListState.loading() = DrugListLoading;

  /// Drugs fetched successfully.
  const factory DrugListState.loaded({
    required List<Drug> drugs,
  }) = DrugListLoaded;

  /// Failed to load or mutate drugs.
  const factory DrugListState.error({
    required String message,
  }) = DrugListError;
}
