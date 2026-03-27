// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photo_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PhotoEntry {
  String get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get encryptedPath => throw _privateConstructorUsedError;
  String get encryptedThumbPath => throw _privateConstructorUsedError;
  int get originalSizeBytes => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Create a copy of PhotoEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PhotoEntryCopyWith<PhotoEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoEntryCopyWith<$Res> {
  factory $PhotoEntryCopyWith(
          PhotoEntry value, $Res Function(PhotoEntry) then) =
      _$PhotoEntryCopyWithImpl<$Res, PhotoEntry>;
  @useResult
  $Res call(
      {String id,
      DateTime date,
      String encryptedPath,
      String encryptedThumbPath,
      int originalSizeBytes,
      String? notes,
      DateTime createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$PhotoEntryCopyWithImpl<$Res, $Val extends PhotoEntry>
    implements $PhotoEntryCopyWith<$Res> {
  _$PhotoEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PhotoEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? encryptedPath = null,
    Object? encryptedThumbPath = null,
    Object? originalSizeBytes = null,
    Object? notes = freezed,
    Object? createdAt = null,
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
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhotoEntryImplCopyWith<$Res>
    implements $PhotoEntryCopyWith<$Res> {
  factory _$$PhotoEntryImplCopyWith(
          _$PhotoEntryImpl value, $Res Function(_$PhotoEntryImpl) then) =
      __$$PhotoEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime date,
      String encryptedPath,
      String encryptedThumbPath,
      int originalSizeBytes,
      String? notes,
      DateTime createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$PhotoEntryImplCopyWithImpl<$Res>
    extends _$PhotoEntryCopyWithImpl<$Res, _$PhotoEntryImpl>
    implements _$$PhotoEntryImplCopyWith<$Res> {
  __$$PhotoEntryImplCopyWithImpl(
      _$PhotoEntryImpl _value, $Res Function(_$PhotoEntryImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhotoEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? encryptedPath = null,
    Object? encryptedThumbPath = null,
    Object? originalSizeBytes = null,
    Object? notes = freezed,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_$PhotoEntryImpl(
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
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$PhotoEntryImpl implements _PhotoEntry {
  const _$PhotoEntryImpl(
      {required this.id,
      required this.date,
      required this.encryptedPath,
      required this.encryptedThumbPath,
      required this.originalSizeBytes,
      this.notes,
      required this.createdAt,
      this.updatedAt});

  @override
  final String id;
  @override
  final DateTime date;
  @override
  final String encryptedPath;
  @override
  final String encryptedThumbPath;
  @override
  final int originalSizeBytes;
  @override
  final String? notes;
  @override
  final DateTime createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'PhotoEntry(id: $id, date: $date, encryptedPath: $encryptedPath, encryptedThumbPath: $encryptedThumbPath, originalSizeBytes: $originalSizeBytes, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhotoEntryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.encryptedPath, encryptedPath) ||
                other.encryptedPath == encryptedPath) &&
            (identical(other.encryptedThumbPath, encryptedThumbPath) ||
                other.encryptedThumbPath == encryptedThumbPath) &&
            (identical(other.originalSizeBytes, originalSizeBytes) ||
                other.originalSizeBytes == originalSizeBytes) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, date, encryptedPath,
      encryptedThumbPath, originalSizeBytes, notes, createdAt, updatedAt);

  /// Create a copy of PhotoEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhotoEntryImplCopyWith<_$PhotoEntryImpl> get copyWith =>
      __$$PhotoEntryImplCopyWithImpl<_$PhotoEntryImpl>(this, _$identity);
}

abstract class _PhotoEntry implements PhotoEntry {
  const factory _PhotoEntry(
      {required final String id,
      required final DateTime date,
      required final String encryptedPath,
      required final String encryptedThumbPath,
      required final int originalSizeBytes,
      final String? notes,
      required final DateTime createdAt,
      final DateTime? updatedAt}) = _$PhotoEntryImpl;

  @override
  String get id;
  @override
  DateTime get date;
  @override
  String get encryptedPath;
  @override
  String get encryptedThumbPath;
  @override
  int get originalSizeBytes;
  @override
  String? get notes;
  @override
  DateTime get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of PhotoEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhotoEntryImplCopyWith<_$PhotoEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
