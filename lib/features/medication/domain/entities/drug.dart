import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hananote/features/medication/domain/entities/enums.dart';

part 'drug.freezed.dart';

/// A medication definition managed by the user.
@freezed
class Drug with _$Drug {
  /// Creates a [Drug].
  const factory Drug({
    required String id,
    required String name,
    required String genericName,
    required DrugCategory category,
    required AdministrationRoute administrationRoute,
    required DosageUnit defaultDosageUnit,
    required bool isActive,
    required DateTime createdAt,
    String? notes,
  }) = _Drug;
}
