// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PhotoModel _$PhotoModelFromJson(Map<String, dynamic> json) {
  return _PhotoModel.fromJson(json);
}

/// @nodoc
mixin _$PhotoModel {
  String get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'encrypted_path')
  String get encryptedPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'encrypted_thumb_path')
  String get encryptedThumbPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_size_bytes')
  int get originalSizeBytes => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this PhotoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PhotoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PhotoModelCopyWith<PhotoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoModelCopyWith<$Res> {
  factory $PhotoModelCopyWith(
          PhotoModel value, $Res Function(PhotoModel) then) =
      _$PhotoModelCopyWithImpl<$Res, PhotoModel>;
  @useResult
  $Res call(
      {String id,
      DateTime date,
      @JsonKey(name: 'encrypted_path') String encryptedPath,
      @JsonKey(name: 'encrypted_thumb_path') String encryptedThumbPath,
      @JsonKey(name: 'original_size_bytes') int originalSizeBytes,
      @JsonKey(name: 'created_at') DateTime createdAt,
      String? notes,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class _$PhotoModelCopyWithImpl<$Res, $Val extends PhotoModel>
    implements $PhotoModelCopyWith<$Res> {
  _$PhotoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PhotoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? encryptedPath = null,
    Object? encryptedThumbPath = null,
    Object? originalSizeBytes = null,
    Object? createdAt = null,
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
      encryptedPath: null == encryptedPath
          ? _value.encryptedPath
          : encryptedPath // ignore: cast_nullable_to_non_nullable
              as String,
      encryptedThumbPath: null == encryptedThumbPath
          ? _value.encryptedThumbPath
          : encryptedThumbPath // ignore: cast_nullable_to_non_nullable
              as String,
      originalSizeBytes: null == originalSizeBytes
          ? _value.originalSizeBytes
          : originalSizeBytes // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
abstract class _$$PhotoModelImplCopyWith<$Res>
    implements $PhotoModelCopyWith<$Res> {
  factory _$$PhotoModelImplCopyWith(
          _$PhotoModelImpl value, $Res Function(_$PhotoModelImpl) then) =
      __$$PhotoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime date,
      @JsonKey(name: 'encrypted_path') String encryptedPath,
      @JsonKey(name: 'encrypted_thumb_path') String encryptedThumbPath,
      @JsonKey(name: 'original_size_bytes') int originalSizeBytes,
      @JsonKey(name: 'created_at') DateTime createdAt,
      String? notes,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class __$$PhotoModelImplCopyWithImpl<$Res>
    extends _$PhotoModelCopyWithImpl<$Res, _$PhotoModelImpl>
    implements _$$PhotoModelImplCopyWith<$Res> {
  __$$PhotoModelImplCopyWithImpl(
      _$PhotoModelImpl _value, $Res Function(_$PhotoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhotoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? encryptedPath = null,
    Object? encryptedThumbPath = null,
    Object? originalSizeBytes = null,
    Object? createdAt = null,
    Object? notes = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$PhotoModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      encryptedPath: null == encryptedPath
          ? _value.encryptedPath
          : encryptedPath // ignore: cast_nullable_to_non_nullable
              as String,
      encryptedThumbPath: null == encryptedThumbPath
          ? _value.encryptedThumbPath
          : encryptedThumbPath // ignore: cast_nullable_to_non_nullable
              as String,
      originalSizeBytes: null == originalSizeBytes
          ? _value.originalSizeBytes
          : originalSizeBytes // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
class _$PhotoModelImpl implements _PhotoModel {
  const _$PhotoModelImpl(
      {required this.id,
      required this.date,
      @JsonKey(name: 'encrypted_path') required this.encryptedPath,
      @JsonKey(name: 'encrypted_thumb_path') required this.encryptedThumbPath,
      @JsonKey(name: 'original_size_bytes') required this.originalSizeBytes,
      @JsonKey(name: 'created_at') required this.createdAt,
      this.notes,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$PhotoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PhotoModelImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime date;
  @override
  @JsonKey(name: 'encrypted_path')
  final String encryptedPath;
  @override
  @JsonKey(name: 'encrypted_thumb_path')
  final String encryptedThumbPath;
  @override
  @JsonKey(name: 'original_size_bytes')
  final int originalSizeBytes;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  final String? notes;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'PhotoModel(id: $id, date: $date, encryptedPath: $encryptedPath, encryptedThumbPath: $encryptedThumbPath, originalSizeBytes: $originalSizeBytes, createdAt: $createdAt, notes: $notes, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhotoModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.encryptedPath, encryptedPath) ||
                other.encryptedPath == encryptedPath) &&
            (identical(other.encryptedThumbPath, encryptedThumbPath) ||
                other.encryptedThumbPath == encryptedThumbPath) &&
            (identical(other.originalSizeBytes, originalSizeBytes) ||
                other.originalSizeBytes == originalSizeBytes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, date, encryptedPath,
      encryptedThumbPath, originalSizeBytes, createdAt, notes, updatedAt);

  /// Create a copy of PhotoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhotoModelImplCopyWith<_$PhotoModelImpl> get copyWith =>
      __$$PhotoModelImplCopyWithImpl<_$PhotoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PhotoModelImplToJson(
      this,
    );
  }
}

abstract class _PhotoModel implements PhotoModel {
  const factory _PhotoModel(
          {required final String id,
          required final DateTime date,
          @JsonKey(name: 'encrypted_path') required final String encryptedPath,
          @JsonKey(name: 'encrypted_thumb_path')
          required final String encryptedThumbPath,
          @JsonKey(name: 'original_size_bytes')
          required final int originalSizeBytes,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          final String? notes,
          @JsonKey(name: 'updated_at') final DateTime? updatedAt}) =
      _$PhotoModelImpl;

  factory _PhotoModel.fromJson(Map<String, dynamic> json) =
      _$PhotoModelImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get date;
  @override
  @JsonKey(name: 'encrypted_path')
  String get encryptedPath;
  @override
  @JsonKey(name: 'encrypted_thumb_path')
  String get encryptedThumbPath;
  @override
  @JsonKey(name: 'original_size_bytes')
  int get originalSizeBytes;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  String? get notes;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;

  /// Create a copy of PhotoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhotoModelImplCopyWith<_$PhotoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
