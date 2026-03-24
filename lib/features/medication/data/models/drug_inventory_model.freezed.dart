// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drug_inventory_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DrugInventoryModel _$DrugInventoryModelFromJson(Map<String, dynamic> json) {
  return _DrugInventoryModel.fromJson(json);
}

/// @nodoc
mixin _$DrugInventoryModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'drug_id')
  String get drugId => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_date')
  String get purchaseDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'expiration_date')
  String? get expirationDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'batch_number')
  String? get batchNumber => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this DrugInventoryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DrugInventoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DrugInventoryModelCopyWith<DrugInventoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DrugInventoryModelCopyWith<$Res> {
  factory $DrugInventoryModelCopyWith(
          DrugInventoryModel value, $Res Function(DrugInventoryModel) then) =
      _$DrugInventoryModelCopyWithImpl<$Res, DrugInventoryModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'drug_id') String drugId,
      double quantity,
      String unit,
      @JsonKey(name: 'purchase_date') String purchaseDate,
      @JsonKey(name: 'updated_at') String updatedAt,
      @JsonKey(name: 'expiration_date') String? expirationDate,
      @JsonKey(name: 'batch_number') String? batchNumber,
      String? notes});
}

/// @nodoc
class _$DrugInventoryModelCopyWithImpl<$Res, $Val extends DrugInventoryModel>
    implements $DrugInventoryModelCopyWith<$Res> {
  _$DrugInventoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DrugInventoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? drugId = null,
    Object? quantity = null,
    Object? unit = null,
    Object? purchaseDate = null,
    Object? updatedAt = null,
    Object? expirationDate = freezed,
    Object? batchNumber = freezed,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      drugId: null == drugId
          ? _value.drugId
          : drugId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseDate: null == purchaseDate
          ? _value.purchaseDate
          : purchaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      expirationDate: freezed == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as String?,
      batchNumber: freezed == batchNumber
          ? _value.batchNumber
          : batchNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DrugInventoryModelImplCopyWith<$Res>
    implements $DrugInventoryModelCopyWith<$Res> {
  factory _$$DrugInventoryModelImplCopyWith(_$DrugInventoryModelImpl value,
          $Res Function(_$DrugInventoryModelImpl) then) =
      __$$DrugInventoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'drug_id') String drugId,
      double quantity,
      String unit,
      @JsonKey(name: 'purchase_date') String purchaseDate,
      @JsonKey(name: 'updated_at') String updatedAt,
      @JsonKey(name: 'expiration_date') String? expirationDate,
      @JsonKey(name: 'batch_number') String? batchNumber,
      String? notes});
}

/// @nodoc
class __$$DrugInventoryModelImplCopyWithImpl<$Res>
    extends _$DrugInventoryModelCopyWithImpl<$Res, _$DrugInventoryModelImpl>
    implements _$$DrugInventoryModelImplCopyWith<$Res> {
  __$$DrugInventoryModelImplCopyWithImpl(_$DrugInventoryModelImpl _value,
      $Res Function(_$DrugInventoryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DrugInventoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? drugId = null,
    Object? quantity = null,
    Object? unit = null,
    Object? purchaseDate = null,
    Object? updatedAt = null,
    Object? expirationDate = freezed,
    Object? batchNumber = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$DrugInventoryModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      drugId: null == drugId
          ? _value.drugId
          : drugId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseDate: null == purchaseDate
          ? _value.purchaseDate
          : purchaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      expirationDate: freezed == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as String?,
      batchNumber: freezed == batchNumber
          ? _value.batchNumber
          : batchNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DrugInventoryModelImpl extends _DrugInventoryModel {
  const _$DrugInventoryModelImpl(
      {required this.id,
      @JsonKey(name: 'drug_id') required this.drugId,
      required this.quantity,
      required this.unit,
      @JsonKey(name: 'purchase_date') required this.purchaseDate,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'expiration_date') this.expirationDate,
      @JsonKey(name: 'batch_number') this.batchNumber,
      this.notes})
      : super._();

  factory _$DrugInventoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DrugInventoryModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'drug_id')
  final String drugId;
  @override
  final double quantity;
  @override
  final String unit;
  @override
  @JsonKey(name: 'purchase_date')
  final String purchaseDate;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @override
  @JsonKey(name: 'expiration_date')
  final String? expirationDate;
  @override
  @JsonKey(name: 'batch_number')
  final String? batchNumber;
  @override
  final String? notes;

  @override
  String toString() {
    return 'DrugInventoryModel(id: $id, drugId: $drugId, quantity: $quantity, unit: $unit, purchaseDate: $purchaseDate, updatedAt: $updatedAt, expirationDate: $expirationDate, batchNumber: $batchNumber, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DrugInventoryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.drugId, drugId) || other.drugId == drugId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.purchaseDate, purchaseDate) ||
                other.purchaseDate == purchaseDate) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.expirationDate, expirationDate) ||
                other.expirationDate == expirationDate) &&
            (identical(other.batchNumber, batchNumber) ||
                other.batchNumber == batchNumber) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, drugId, quantity, unit,
      purchaseDate, updatedAt, expirationDate, batchNumber, notes);

  /// Create a copy of DrugInventoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DrugInventoryModelImplCopyWith<_$DrugInventoryModelImpl> get copyWith =>
      __$$DrugInventoryModelImplCopyWithImpl<_$DrugInventoryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DrugInventoryModelImplToJson(
      this,
    );
  }
}

abstract class _DrugInventoryModel extends DrugInventoryModel {
  const factory _DrugInventoryModel(
      {required final String id,
      @JsonKey(name: 'drug_id') required final String drugId,
      required final double quantity,
      required final String unit,
      @JsonKey(name: 'purchase_date') required final String purchaseDate,
      @JsonKey(name: 'updated_at') required final String updatedAt,
      @JsonKey(name: 'expiration_date') final String? expirationDate,
      @JsonKey(name: 'batch_number') final String? batchNumber,
      final String? notes}) = _$DrugInventoryModelImpl;
  const _DrugInventoryModel._() : super._();

  factory _DrugInventoryModel.fromJson(Map<String, dynamic> json) =
      _$DrugInventoryModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'drug_id')
  String get drugId;
  @override
  double get quantity;
  @override
  String get unit;
  @override
  @JsonKey(name: 'purchase_date')
  String get purchaseDate;
  @override
  @JsonKey(name: 'updated_at')
  String get updatedAt;
  @override
  @JsonKey(name: 'expiration_date')
  String? get expirationDate;
  @override
  @JsonKey(name: 'batch_number')
  String? get batchNumber;
  @override
  String? get notes;

  /// Create a copy of DrugInventoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DrugInventoryModelImplCopyWith<_$DrugInventoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
