// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drug_inventory.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DrugInventory {
  String get id => throw _privateConstructorUsedError;
  String get drugId => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  DosageUnit get unit => throw _privateConstructorUsedError;
  DateTime get purchaseDate => throw _privateConstructorUsedError;
  DateTime? get expirationDate => throw _privateConstructorUsedError;
  String? get batchNumber => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Create a copy of DrugInventory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DrugInventoryCopyWith<DrugInventory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DrugInventoryCopyWith<$Res> {
  factory $DrugInventoryCopyWith(
          DrugInventory value, $Res Function(DrugInventory) then) =
      _$DrugInventoryCopyWithImpl<$Res, DrugInventory>;
  @useResult
  $Res call(
      {String id,
      String drugId,
      double quantity,
      DosageUnit unit,
      DateTime purchaseDate,
      DateTime? expirationDate,
      String? batchNumber,
      String? notes,
      DateTime updatedAt});
}

/// @nodoc
class _$DrugInventoryCopyWithImpl<$Res, $Val extends DrugInventory>
    implements $DrugInventoryCopyWith<$Res> {
  _$DrugInventoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DrugInventory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? drugId = null,
    Object? quantity = null,
    Object? unit = null,
    Object? purchaseDate = null,
    Object? expirationDate = freezed,
    Object? batchNumber = freezed,
    Object? notes = freezed,
    Object? updatedAt = null,
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
              as DosageUnit,
      purchaseDate: null == purchaseDate
          ? _value.purchaseDate
          : purchaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expirationDate: freezed == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      batchNumber: freezed == batchNumber
          ? _value.batchNumber
          : batchNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DrugInventoryImplCopyWith<$Res>
    implements $DrugInventoryCopyWith<$Res> {
  factory _$$DrugInventoryImplCopyWith(
          _$DrugInventoryImpl value, $Res Function(_$DrugInventoryImpl) then) =
      __$$DrugInventoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String drugId,
      double quantity,
      DosageUnit unit,
      DateTime purchaseDate,
      DateTime? expirationDate,
      String? batchNumber,
      String? notes,
      DateTime updatedAt});
}

/// @nodoc
class __$$DrugInventoryImplCopyWithImpl<$Res>
    extends _$DrugInventoryCopyWithImpl<$Res, _$DrugInventoryImpl>
    implements _$$DrugInventoryImplCopyWith<$Res> {
  __$$DrugInventoryImplCopyWithImpl(
      _$DrugInventoryImpl _value, $Res Function(_$DrugInventoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of DrugInventory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? drugId = null,
    Object? quantity = null,
    Object? unit = null,
    Object? purchaseDate = null,
    Object? expirationDate = freezed,
    Object? batchNumber = freezed,
    Object? notes = freezed,
    Object? updatedAt = null,
  }) {
    return _then(_$DrugInventoryImpl(
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
              as DosageUnit,
      purchaseDate: null == purchaseDate
          ? _value.purchaseDate
          : purchaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expirationDate: freezed == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      batchNumber: freezed == batchNumber
          ? _value.batchNumber
          : batchNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$DrugInventoryImpl implements _DrugInventory {
  const _$DrugInventoryImpl(
      {required this.id,
      required this.drugId,
      required this.quantity,
      required this.unit,
      required this.purchaseDate,
      this.expirationDate,
      this.batchNumber,
      this.notes,
      required this.updatedAt})
      : assert(quantity >= 0, 'quantity must be zero or positive');

  @override
  final String id;
  @override
  final String drugId;
  @override
  final double quantity;
  @override
  final DosageUnit unit;
  @override
  final DateTime purchaseDate;
  @override
  final DateTime? expirationDate;
  @override
  final String? batchNumber;
  @override
  final String? notes;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'DrugInventory(id: $id, drugId: $drugId, quantity: $quantity, unit: $unit, purchaseDate: $purchaseDate, expirationDate: $expirationDate, batchNumber: $batchNumber, notes: $notes, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DrugInventoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.drugId, drugId) || other.drugId == drugId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.purchaseDate, purchaseDate) ||
                other.purchaseDate == purchaseDate) &&
            (identical(other.expirationDate, expirationDate) ||
                other.expirationDate == expirationDate) &&
            (identical(other.batchNumber, batchNumber) ||
                other.batchNumber == batchNumber) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, drugId, quantity, unit,
      purchaseDate, expirationDate, batchNumber, notes, updatedAt);

  /// Create a copy of DrugInventory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DrugInventoryImplCopyWith<_$DrugInventoryImpl> get copyWith =>
      __$$DrugInventoryImplCopyWithImpl<_$DrugInventoryImpl>(this, _$identity);
}

abstract class _DrugInventory implements DrugInventory {
  const factory _DrugInventory(
      {required final String id,
      required final String drugId,
      required final double quantity,
      required final DosageUnit unit,
      required final DateTime purchaseDate,
      final DateTime? expirationDate,
      final String? batchNumber,
      final String? notes,
      required final DateTime updatedAt}) = _$DrugInventoryImpl;

  @override
  String get id;
  @override
  String get drugId;
  @override
  double get quantity;
  @override
  DosageUnit get unit;
  @override
  DateTime get purchaseDate;
  @override
  DateTime? get expirationDate;
  @override
  String? get batchNumber;
  @override
  String? get notes;
  @override
  DateTime get updatedAt;

  /// Create a copy of DrugInventory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DrugInventoryImplCopyWith<_$DrugInventoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
