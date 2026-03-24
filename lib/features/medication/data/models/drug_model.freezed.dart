// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drug_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DrugModel _$DrugModelFromJson(Map<String, dynamic> json) {
  return _DrugModel.fromJson(json);
}

/// @nodoc
mixin _$DrugModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'generic_name')
  String get genericName => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'administration_route')
  String get administrationRoute => throw _privateConstructorUsedError;
  @JsonKey(name: 'default_dosage_unit')
  String get defaultDosageUnit => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  int get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this DrugModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DrugModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DrugModelCopyWith<DrugModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DrugModelCopyWith<$Res> {
  factory $DrugModelCopyWith(DrugModel value, $Res Function(DrugModel) then) =
      _$DrugModelCopyWithImpl<$Res, DrugModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      @JsonKey(name: 'generic_name') String genericName,
      String category,
      @JsonKey(name: 'administration_route') String administrationRoute,
      @JsonKey(name: 'default_dosage_unit') String defaultDosageUnit,
      @JsonKey(name: 'is_active') int isActive,
      @JsonKey(name: 'created_at') String createdAt,
      String? notes});
}

/// @nodoc
class _$DrugModelCopyWithImpl<$Res, $Val extends DrugModel>
    implements $DrugModelCopyWith<$Res> {
  _$DrugModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DrugModel
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
    Object? isActive = null,
    Object? createdAt = null,
    Object? notes = freezed,
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
              as String,
      administrationRoute: null == administrationRoute
          ? _value.administrationRoute
          : administrationRoute // ignore: cast_nullable_to_non_nullable
              as String,
      defaultDosageUnit: null == defaultDosageUnit
          ? _value.defaultDosageUnit
          : defaultDosageUnit // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DrugModelImplCopyWith<$Res>
    implements $DrugModelCopyWith<$Res> {
  factory _$$DrugModelImplCopyWith(
          _$DrugModelImpl value, $Res Function(_$DrugModelImpl) then) =
      __$$DrugModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      @JsonKey(name: 'generic_name') String genericName,
      String category,
      @JsonKey(name: 'administration_route') String administrationRoute,
      @JsonKey(name: 'default_dosage_unit') String defaultDosageUnit,
      @JsonKey(name: 'is_active') int isActive,
      @JsonKey(name: 'created_at') String createdAt,
      String? notes});
}

/// @nodoc
class __$$DrugModelImplCopyWithImpl<$Res>
    extends _$DrugModelCopyWithImpl<$Res, _$DrugModelImpl>
    implements _$$DrugModelImplCopyWith<$Res> {
  __$$DrugModelImplCopyWithImpl(
      _$DrugModelImpl _value, $Res Function(_$DrugModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DrugModel
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
    Object? isActive = null,
    Object? createdAt = null,
    Object? notes = freezed,
  }) {
    return _then(_$DrugModelImpl(
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
              as String,
      administrationRoute: null == administrationRoute
          ? _value.administrationRoute
          : administrationRoute // ignore: cast_nullable_to_non_nullable
              as String,
      defaultDosageUnit: null == defaultDosageUnit
          ? _value.defaultDosageUnit
          : defaultDosageUnit // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DrugModelImpl extends _DrugModel {
  const _$DrugModelImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'generic_name') required this.genericName,
      required this.category,
      @JsonKey(name: 'administration_route') required this.administrationRoute,
      @JsonKey(name: 'default_dosage_unit') required this.defaultDosageUnit,
      @JsonKey(name: 'is_active') required this.isActive,
      @JsonKey(name: 'created_at') required this.createdAt,
      this.notes})
      : super._();

  factory _$DrugModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DrugModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  @JsonKey(name: 'generic_name')
  final String genericName;
  @override
  final String category;
  @override
  @JsonKey(name: 'administration_route')
  final String administrationRoute;
  @override
  @JsonKey(name: 'default_dosage_unit')
  final String defaultDosageUnit;
  @override
  @JsonKey(name: 'is_active')
  final int isActive;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  final String? notes;

  @override
  String toString() {
    return 'DrugModel(id: $id, name: $name, genericName: $genericName, category: $category, administrationRoute: $administrationRoute, defaultDosageUnit: $defaultDosageUnit, isActive: $isActive, createdAt: $createdAt, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DrugModelImpl &&
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
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, genericName, category,
      administrationRoute, defaultDosageUnit, isActive, createdAt, notes);

  /// Create a copy of DrugModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DrugModelImplCopyWith<_$DrugModelImpl> get copyWith =>
      __$$DrugModelImplCopyWithImpl<_$DrugModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DrugModelImplToJson(
      this,
    );
  }
}

abstract class _DrugModel extends DrugModel {
  const factory _DrugModel(
      {required final String id,
      required final String name,
      @JsonKey(name: 'generic_name') required final String genericName,
      required final String category,
      @JsonKey(name: 'administration_route')
      required final String administrationRoute,
      @JsonKey(name: 'default_dosage_unit')
      required final String defaultDosageUnit,
      @JsonKey(name: 'is_active') required final int isActive,
      @JsonKey(name: 'created_at') required final String createdAt,
      final String? notes}) = _$DrugModelImpl;
  const _DrugModel._() : super._();

  factory _DrugModel.fromJson(Map<String, dynamic> json) =
      _$DrugModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'generic_name')
  String get genericName;
  @override
  String get category;
  @override
  @JsonKey(name: 'administration_route')
  String get administrationRoute;
  @override
  @JsonKey(name: 'default_dosage_unit')
  String get defaultDosageUnit;
  @override
  @JsonKey(name: 'is_active')
  int get isActive;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  String? get notes;

  /// Create a copy of DrugModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DrugModelImplCopyWith<_$DrugModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
