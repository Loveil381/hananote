// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drug.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Drug {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get genericName => throw _privateConstructorUsedError;
  DrugCategory get category => throw _privateConstructorUsedError;
  AdministrationRoute get administrationRoute =>
      throw _privateConstructorUsedError;
  DosageUnit get defaultDosageUnit => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Create a copy of Drug
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DrugCopyWith<Drug> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DrugCopyWith<$Res> {
  factory $DrugCopyWith(Drug value, $Res Function(Drug) then) =
      _$DrugCopyWithImpl<$Res, Drug>;
  @useResult
  $Res call(
      {String id,
      String name,
      String genericName,
      DrugCategory category,
      AdministrationRoute administrationRoute,
      DosageUnit defaultDosageUnit,
      String? notes,
      bool isActive,
      DateTime createdAt});
}

/// @nodoc
class _$DrugCopyWithImpl<$Res, $Val extends Drug>
    implements $DrugCopyWith<$Res> {
  _$DrugCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Drug
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? genericName = null,
    Object? category = null,
    Object? administrationRoute = null,
    Object? defaultDosageUnit = null,
    Object? notes = freezed,
    Object? isActive = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      genericName: null == genericName
          ? _value.genericName
          : genericName // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as DrugCategory,
      administrationRoute: null == administrationRoute
          ? _value.administrationRoute
          : administrationRoute // ignore: cast_nullable_to_non_nullable
              as AdministrationRoute,
      defaultDosageUnit: null == defaultDosageUnit
          ? _value.defaultDosageUnit
          : defaultDosageUnit // ignore: cast_nullable_to_non_nullable
              as DosageUnit,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DrugImplCopyWith<$Res> implements $DrugCopyWith<$Res> {
  factory _$$DrugImplCopyWith(
          _$DrugImpl value, $Res Function(_$DrugImpl) then) =
      __$$DrugImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String genericName,
      DrugCategory category,
      AdministrationRoute administrationRoute,
      DosageUnit defaultDosageUnit,
      String? notes,
      bool isActive,
      DateTime createdAt});
}

/// @nodoc
class __$$DrugImplCopyWithImpl<$Res>
    extends _$DrugCopyWithImpl<$Res, _$DrugImpl>
    implements _$$DrugImplCopyWith<$Res> {
  __$$DrugImplCopyWithImpl(_$DrugImpl _value, $Res Function(_$DrugImpl) _then)
      : super(_value, _then);

  /// Create a copy of Drug
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? genericName = null,
    Object? category = null,
    Object? administrationRoute = null,
    Object? defaultDosageUnit = null,
    Object? notes = freezed,
    Object? isActive = null,
    Object? createdAt = null,
  }) {
    return _then(_$DrugImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      genericName: null == genericName
          ? _value.genericName
          : genericName // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as DrugCategory,
      administrationRoute: null == administrationRoute
          ? _value.administrationRoute
          : administrationRoute // ignore: cast_nullable_to_non_nullable
              as AdministrationRoute,
      defaultDosageUnit: null == defaultDosageUnit
          ? _value.defaultDosageUnit
          : defaultDosageUnit // ignore: cast_nullable_to_non_nullable
              as DosageUnit,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$DrugImpl implements _Drug {
  const _$DrugImpl(
      {required this.id,
      required this.name,
      required this.genericName,
      required this.category,
      required this.administrationRoute,
      required this.defaultDosageUnit,
      this.notes,
      required this.isActive,
      required this.createdAt});

  @override
  final String id;
  @override
  final String name;
  @override
  final String genericName;
  @override
  final DrugCategory category;
  @override
  final AdministrationRoute administrationRoute;
  @override
  final DosageUnit defaultDosageUnit;
  @override
  final String? notes;
  @override
  final bool isActive;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'Drug(id: $id, name: $name, genericName: $genericName, category: $category, administrationRoute: $administrationRoute, defaultDosageUnit: $defaultDosageUnit, notes: $notes, isActive: $isActive, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DrugImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.genericName, genericName) ||
                other.genericName == genericName) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.administrationRoute, administrationRoute) ||
                other.administrationRoute == administrationRoute) &&
            (identical(other.defaultDosageUnit, defaultDosageUnit) ||
                other.defaultDosageUnit == defaultDosageUnit) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, genericName, category,
      administrationRoute, defaultDosageUnit, notes, isActive, createdAt);

  /// Create a copy of Drug
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DrugImplCopyWith<_$DrugImpl> get copyWith =>
      __$$DrugImplCopyWithImpl<_$DrugImpl>(this, _$identity);
}

abstract class _Drug implements Drug {
  const factory _Drug(
      {required final String id,
      required final String name,
      required final String genericName,
      required final DrugCategory category,
      required final AdministrationRoute administrationRoute,
      required final DosageUnit defaultDosageUnit,
      final String? notes,
      required final bool isActive,
      required final DateTime createdAt}) = _$DrugImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String get genericName;
  @override
  DrugCategory get category;
  @override
  AdministrationRoute get administrationRoute;
  @override
  DosageUnit get defaultDosageUnit;
  @override
  String? get notes;
  @override
  bool get isActive;
  @override
  DateTime get createdAt;

  /// Create a copy of Drug
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DrugImplCopyWith<_$DrugImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
