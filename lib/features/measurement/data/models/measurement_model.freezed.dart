// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'measurement_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MeasurementModel _$MeasurementModelFromJson(Map<String, dynamic> json) {
  return _MeasurementModel.fromJson(json);
}

/// @nodoc
mixin _$MeasurementModel {
  String get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  double? get bust => throw _privateConstructorUsedError;
  double? get underbust => throw _privateConstructorUsedError;
  double? get waist => throw _privateConstructorUsedError;
  double? get hip => throw _privateConstructorUsedError;
  double? get thigh => throw _privateConstructorUsedError;
  double? get bicep => throw _privateConstructorUsedError;
  double? get shoulder => throw _privateConstructorUsedError;
  double? get neck => throw _privateConstructorUsedError;
  double? get weight => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this MeasurementModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MeasurementModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MeasurementModelCopyWith<MeasurementModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeasurementModelCopyWith<$Res> {
  factory $MeasurementModelCopyWith(
          MeasurementModel value, $Res Function(MeasurementModel) then) =
      _$MeasurementModelCopyWithImpl<$Res, MeasurementModel>;
  @useResult
  $Res call(
      {String id,
      DateTime date,
      @JsonKey(name: 'created_at') DateTime createdAt,
      double? bust,
      double? underbust,
      double? waist,
      double? hip,
      double? thigh,
      double? bicep,
      double? shoulder,
      double? neck,
      double? weight,
      String? notes,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class _$MeasurementModelCopyWithImpl<$Res, $Val extends MeasurementModel>
    implements $MeasurementModelCopyWith<$Res> {
  _$MeasurementModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MeasurementModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? createdAt = null,
    Object? bust = freezed,
    Object? underbust = freezed,
    Object? waist = freezed,
    Object? hip = freezed,
    Object? thigh = freezed,
    Object? bicep = freezed,
    Object? shoulder = freezed,
    Object? neck = freezed,
    Object? weight = freezed,
    Object? notes = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      bust: freezed == bust
          ? _value.bust
          : bust // ignore: cast_nullable_to_non_nullable
              as double?,
      underbust: freezed == underbust
          ? _value.underbust
          : underbust // ignore: cast_nullable_to_non_nullable
              as double?,
      waist: freezed == waist
          ? _value.waist
          : waist // ignore: cast_nullable_to_non_nullable
              as double?,
      hip: freezed == hip
          ? _value.hip
          : hip // ignore: cast_nullable_to_non_nullable
              as double?,
      thigh: freezed == thigh
          ? _value.thigh
          : thigh // ignore: cast_nullable_to_non_nullable
              as double?,
      bicep: freezed == bicep
          ? _value.bicep
          : bicep // ignore: cast_nullable_to_non_nullable
              as double?,
      shoulder: freezed == shoulder
          ? _value.shoulder
          : shoulder // ignore: cast_nullable_to_non_nullable
              as double?,
      neck: freezed == neck
          ? _value.neck
          : neck // ignore: cast_nullable_to_non_nullable
              as double?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MeasurementModelImplCopyWith<$Res>
    implements $MeasurementModelCopyWith<$Res> {
  factory _$$MeasurementModelImplCopyWith(_$MeasurementModelImpl value,
          $Res Function(_$MeasurementModelImpl) then) =
      __$$MeasurementModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime date,
      @JsonKey(name: 'created_at') DateTime createdAt,
      double? bust,
      double? underbust,
      double? waist,
      double? hip,
      double? thigh,
      double? bicep,
      double? shoulder,
      double? neck,
      double? weight,
      String? notes,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class __$$MeasurementModelImplCopyWithImpl<$Res>
    extends _$MeasurementModelCopyWithImpl<$Res, _$MeasurementModelImpl>
    implements _$$MeasurementModelImplCopyWith<$Res> {
  __$$MeasurementModelImplCopyWithImpl(_$MeasurementModelImpl _value,
      $Res Function(_$MeasurementModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MeasurementModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? createdAt = null,
    Object? bust = freezed,
    Object? underbust = freezed,
    Object? waist = freezed,
    Object? hip = freezed,
    Object? thigh = freezed,
    Object? bicep = freezed,
    Object? shoulder = freezed,
    Object? neck = freezed,
    Object? weight = freezed,
    Object? notes = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$MeasurementModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      bust: freezed == bust
          ? _value.bust
          : bust // ignore: cast_nullable_to_non_nullable
              as double?,
      underbust: freezed == underbust
          ? _value.underbust
          : underbust // ignore: cast_nullable_to_non_nullable
              as double?,
      waist: freezed == waist
          ? _value.waist
          : waist // ignore: cast_nullable_to_non_nullable
              as double?,
      hip: freezed == hip
          ? _value.hip
          : hip // ignore: cast_nullable_to_non_nullable
              as double?,
      thigh: freezed == thigh
          ? _value.thigh
          : thigh // ignore: cast_nullable_to_non_nullable
              as double?,
      bicep: freezed == bicep
          ? _value.bicep
          : bicep // ignore: cast_nullable_to_non_nullable
              as double?,
      shoulder: freezed == shoulder
          ? _value.shoulder
          : shoulder // ignore: cast_nullable_to_non_nullable
              as double?,
      neck: freezed == neck
          ? _value.neck
          : neck // ignore: cast_nullable_to_non_nullable
              as double?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MeasurementModelImpl implements _MeasurementModel {
  const _$MeasurementModelImpl(
      {required this.id,
      required this.date,
      @JsonKey(name: 'created_at') required this.createdAt,
      this.bust,
      this.underbust,
      this.waist,
      this.hip,
      this.thigh,
      this.bicep,
      this.shoulder,
      this.neck,
      this.weight,
      this.notes,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$MeasurementModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MeasurementModelImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime date;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  final double? bust;
  @override
  final double? underbust;
  @override
  final double? waist;
  @override
  final double? hip;
  @override
  final double? thigh;
  @override
  final double? bicep;
  @override
  final double? shoulder;
  @override
  final double? neck;
  @override
  final double? weight;
  @override
  final String? notes;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'MeasurementModel(id: $id, date: $date, createdAt: $createdAt, bust: $bust, underbust: $underbust, waist: $waist, hip: $hip, thigh: $thigh, bicep: $bicep, shoulder: $shoulder, neck: $neck, weight: $weight, notes: $notes, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MeasurementModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.bust, bust) || other.bust == bust) &&
            (identical(other.underbust, underbust) ||
                other.underbust == underbust) &&
            (identical(other.waist, waist) || other.waist == waist) &&
            (identical(other.hip, hip) || other.hip == hip) &&
            (identical(other.thigh, thigh) || other.thigh == thigh) &&
            (identical(other.bicep, bicep) || other.bicep == bicep) &&
            (identical(other.shoulder, shoulder) ||
                other.shoulder == shoulder) &&
            (identical(other.neck, neck) || other.neck == neck) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      date,
      createdAt,
      bust,
      underbust,
      waist,
      hip,
      thigh,
      bicep,
      shoulder,
      neck,
      weight,
      notes,
      updatedAt);

  /// Create a copy of MeasurementModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MeasurementModelImplCopyWith<_$MeasurementModelImpl> get copyWith =>
      __$$MeasurementModelImplCopyWithImpl<_$MeasurementModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MeasurementModelImplToJson(
      this,
    );
  }
}

abstract class _MeasurementModel implements MeasurementModel {
  const factory _MeasurementModel(
          {required final String id,
          required final DateTime date,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          final double? bust,
          final double? underbust,
          final double? waist,
          final double? hip,
          final double? thigh,
          final double? bicep,
          final double? shoulder,
          final double? neck,
          final double? weight,
          final String? notes,
          @JsonKey(name: 'updated_at') final DateTime? updatedAt}) =
      _$MeasurementModelImpl;

  factory _MeasurementModel.fromJson(Map<String, dynamic> json) =
      _$MeasurementModelImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get date;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  double? get bust;
  @override
  double? get underbust;
  @override
  double? get waist;
  @override
  double? get hip;
  @override
  double? get thigh;
  @override
  double? get bicep;
  @override
  double? get shoulder;
  @override
  double? get neck;
  @override
  double? get weight;
  @override
  String? get notes;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;

  /// Create a copy of MeasurementModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MeasurementModelImplCopyWith<_$MeasurementModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
