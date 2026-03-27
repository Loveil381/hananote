// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Failure {
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) database,
    required TResult Function(String message) crypto,
    required TResult Function(String message) storage,
    required TResult Function(String message) auth,
    required TResult Function(String message) notification,
    required TResult Function(String message) validation,
    required TResult Function(String message) unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? database,
    TResult? Function(String message)? crypto,
    TResult? Function(String message)? storage,
    TResult? Function(String message)? auth,
    TResult? Function(String message)? notification,
    TResult? Function(String message)? validation,
    TResult? Function(String message)? unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? database,
    TResult Function(String message)? crypto,
    TResult Function(String message)? storage,
    TResult Function(String message)? auth,
    TResult Function(String message)? notification,
    TResult Function(String message)? validation,
    TResult Function(String message)? unexpected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DatabaseFailure value) database,
    required TResult Function(CryptoFailure value) crypto,
    required TResult Function(StorageFailure value) storage,
    required TResult Function(AuthFailure value) auth,
    required TResult Function(NotificationFailure value) notification,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(UnexpectedFailure value) unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DatabaseFailure value)? database,
    TResult? Function(CryptoFailure value)? crypto,
    TResult? Function(StorageFailure value)? storage,
    TResult? Function(AuthFailure value)? auth,
    TResult? Function(NotificationFailure value)? notification,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(UnexpectedFailure value)? unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DatabaseFailure value)? database,
    TResult Function(CryptoFailure value)? crypto,
    TResult Function(StorageFailure value)? storage,
    TResult Function(AuthFailure value)? auth,
    TResult Function(NotificationFailure value)? notification,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(UnexpectedFailure value)? unexpected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FailureCopyWith<Failure> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res, Failure>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$FailureCopyWithImpl<$Res, $Val extends Failure>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DatabaseFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$DatabaseFailureImplCopyWith(_$DatabaseFailureImpl value,
          $Res Function(_$DatabaseFailureImpl) then) =
      __$$DatabaseFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$DatabaseFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$DatabaseFailureImpl>
    implements _$$DatabaseFailureImplCopyWith<$Res> {
  __$$DatabaseFailureImplCopyWithImpl(
      _$DatabaseFailureImpl _value, $Res Function(_$DatabaseFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$DatabaseFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DatabaseFailureImpl implements DatabaseFailure {
  const _$DatabaseFailureImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.database(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DatabaseFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DatabaseFailureImplCopyWith<_$DatabaseFailureImpl> get copyWith =>
      __$$DatabaseFailureImplCopyWithImpl<_$DatabaseFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) database,
    required TResult Function(String message) crypto,
    required TResult Function(String message) storage,
    required TResult Function(String message) auth,
    required TResult Function(String message) notification,
    required TResult Function(String message) validation,
    required TResult Function(String message) unexpected,
  }) {
    return database(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? database,
    TResult? Function(String message)? crypto,
    TResult? Function(String message)? storage,
    TResult? Function(String message)? auth,
    TResult? Function(String message)? notification,
    TResult? Function(String message)? validation,
    TResult? Function(String message)? unexpected,
  }) {
    return database?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? database,
    TResult Function(String message)? crypto,
    TResult Function(String message)? storage,
    TResult Function(String message)? auth,
    TResult Function(String message)? notification,
    TResult Function(String message)? validation,
    TResult Function(String message)? unexpected,
    required TResult orElse(),
  }) {
    if (database != null) {
      return database(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DatabaseFailure value) database,
    required TResult Function(CryptoFailure value) crypto,
    required TResult Function(StorageFailure value) storage,
    required TResult Function(AuthFailure value) auth,
    required TResult Function(NotificationFailure value) notification,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(UnexpectedFailure value) unexpected,
  }) {
    return database(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DatabaseFailure value)? database,
    TResult? Function(CryptoFailure value)? crypto,
    TResult? Function(StorageFailure value)? storage,
    TResult? Function(AuthFailure value)? auth,
    TResult? Function(NotificationFailure value)? notification,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(UnexpectedFailure value)? unexpected,
  }) {
    return database?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DatabaseFailure value)? database,
    TResult Function(CryptoFailure value)? crypto,
    TResult Function(StorageFailure value)? storage,
    TResult Function(AuthFailure value)? auth,
    TResult Function(NotificationFailure value)? notification,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(UnexpectedFailure value)? unexpected,
    required TResult orElse(),
  }) {
    if (database != null) {
      return database(this);
    }
    return orElse();
  }
}

abstract class DatabaseFailure implements Failure {
  const factory DatabaseFailure({required final String message}) =
      _$DatabaseFailureImpl;

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DatabaseFailureImplCopyWith<_$DatabaseFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CryptoFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$CryptoFailureImplCopyWith(
          _$CryptoFailureImpl value, $Res Function(_$CryptoFailureImpl) then) =
      __$$CryptoFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$CryptoFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$CryptoFailureImpl>
    implements _$$CryptoFailureImplCopyWith<$Res> {
  __$$CryptoFailureImplCopyWithImpl(
      _$CryptoFailureImpl _value, $Res Function(_$CryptoFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$CryptoFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CryptoFailureImpl implements CryptoFailure {
  const _$CryptoFailureImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.crypto(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CryptoFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CryptoFailureImplCopyWith<_$CryptoFailureImpl> get copyWith =>
      __$$CryptoFailureImplCopyWithImpl<_$CryptoFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) database,
    required TResult Function(String message) crypto,
    required TResult Function(String message) storage,
    required TResult Function(String message) auth,
    required TResult Function(String message) notification,
    required TResult Function(String message) validation,
    required TResult Function(String message) unexpected,
  }) {
    return crypto(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? database,
    TResult? Function(String message)? crypto,
    TResult? Function(String message)? storage,
    TResult? Function(String message)? auth,
    TResult? Function(String message)? notification,
    TResult? Function(String message)? validation,
    TResult? Function(String message)? unexpected,
  }) {
    return crypto?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? database,
    TResult Function(String message)? crypto,
    TResult Function(String message)? storage,
    TResult Function(String message)? auth,
    TResult Function(String message)? notification,
    TResult Function(String message)? validation,
    TResult Function(String message)? unexpected,
    required TResult orElse(),
  }) {
    if (crypto != null) {
      return crypto(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DatabaseFailure value) database,
    required TResult Function(CryptoFailure value) crypto,
    required TResult Function(StorageFailure value) storage,
    required TResult Function(AuthFailure value) auth,
    required TResult Function(NotificationFailure value) notification,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(UnexpectedFailure value) unexpected,
  }) {
    return crypto(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DatabaseFailure value)? database,
    TResult? Function(CryptoFailure value)? crypto,
    TResult? Function(StorageFailure value)? storage,
    TResult? Function(AuthFailure value)? auth,
    TResult? Function(NotificationFailure value)? notification,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(UnexpectedFailure value)? unexpected,
  }) {
    return crypto?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DatabaseFailure value)? database,
    TResult Function(CryptoFailure value)? crypto,
    TResult Function(StorageFailure value)? storage,
    TResult Function(AuthFailure value)? auth,
    TResult Function(NotificationFailure value)? notification,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(UnexpectedFailure value)? unexpected,
    required TResult orElse(),
  }) {
    if (crypto != null) {
      return crypto(this);
    }
    return orElse();
  }
}

abstract class CryptoFailure implements Failure {
  const factory CryptoFailure({required final String message}) =
      _$CryptoFailureImpl;

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CryptoFailureImplCopyWith<_$CryptoFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StorageFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$StorageFailureImplCopyWith(_$StorageFailureImpl value,
          $Res Function(_$StorageFailureImpl) then) =
      __$$StorageFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$StorageFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$StorageFailureImpl>
    implements _$$StorageFailureImplCopyWith<$Res> {
  __$$StorageFailureImplCopyWithImpl(
      _$StorageFailureImpl _value, $Res Function(_$StorageFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$StorageFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$StorageFailureImpl implements StorageFailure {
  const _$StorageFailureImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.storage(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StorageFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StorageFailureImplCopyWith<_$StorageFailureImpl> get copyWith =>
      __$$StorageFailureImplCopyWithImpl<_$StorageFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) database,
    required TResult Function(String message) crypto,
    required TResult Function(String message) storage,
    required TResult Function(String message) auth,
    required TResult Function(String message) notification,
    required TResult Function(String message) validation,
    required TResult Function(String message) unexpected,
  }) {
    return storage(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? database,
    TResult? Function(String message)? crypto,
    TResult? Function(String message)? storage,
    TResult? Function(String message)? auth,
    TResult? Function(String message)? notification,
    TResult? Function(String message)? validation,
    TResult? Function(String message)? unexpected,
  }) {
    return storage?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? database,
    TResult Function(String message)? crypto,
    TResult Function(String message)? storage,
    TResult Function(String message)? auth,
    TResult Function(String message)? notification,
    TResult Function(String message)? validation,
    TResult Function(String message)? unexpected,
    required TResult orElse(),
  }) {
    if (storage != null) {
      return storage(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DatabaseFailure value) database,
    required TResult Function(CryptoFailure value) crypto,
    required TResult Function(StorageFailure value) storage,
    required TResult Function(AuthFailure value) auth,
    required TResult Function(NotificationFailure value) notification,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(UnexpectedFailure value) unexpected,
  }) {
    return storage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DatabaseFailure value)? database,
    TResult? Function(CryptoFailure value)? crypto,
    TResult? Function(StorageFailure value)? storage,
    TResult? Function(AuthFailure value)? auth,
    TResult? Function(NotificationFailure value)? notification,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(UnexpectedFailure value)? unexpected,
  }) {
    return storage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DatabaseFailure value)? database,
    TResult Function(CryptoFailure value)? crypto,
    TResult Function(StorageFailure value)? storage,
    TResult Function(AuthFailure value)? auth,
    TResult Function(NotificationFailure value)? notification,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(UnexpectedFailure value)? unexpected,
    required TResult orElse(),
  }) {
    if (storage != null) {
      return storage(this);
    }
    return orElse();
  }
}

abstract class StorageFailure implements Failure {
  const factory StorageFailure({required final String message}) =
      _$StorageFailureImpl;

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StorageFailureImplCopyWith<_$StorageFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$AuthFailureImplCopyWith(
          _$AuthFailureImpl value, $Res Function(_$AuthFailureImpl) then) =
      __$$AuthFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$AuthFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$AuthFailureImpl>
    implements _$$AuthFailureImplCopyWith<$Res> {
  __$$AuthFailureImplCopyWithImpl(
      _$AuthFailureImpl _value, $Res Function(_$AuthFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$AuthFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthFailureImpl implements AuthFailure {
  const _$AuthFailureImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.auth(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthFailureImplCopyWith<_$AuthFailureImpl> get copyWith =>
      __$$AuthFailureImplCopyWithImpl<_$AuthFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) database,
    required TResult Function(String message) crypto,
    required TResult Function(String message) storage,
    required TResult Function(String message) auth,
    required TResult Function(String message) notification,
    required TResult Function(String message) validation,
    required TResult Function(String message) unexpected,
  }) {
    return auth(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? database,
    TResult? Function(String message)? crypto,
    TResult? Function(String message)? storage,
    TResult? Function(String message)? auth,
    TResult? Function(String message)? notification,
    TResult? Function(String message)? validation,
    TResult? Function(String message)? unexpected,
  }) {
    return auth?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? database,
    TResult Function(String message)? crypto,
    TResult Function(String message)? storage,
    TResult Function(String message)? auth,
    TResult Function(String message)? notification,
    TResult Function(String message)? validation,
    TResult Function(String message)? unexpected,
    required TResult orElse(),
  }) {
    if (auth != null) {
      return auth(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DatabaseFailure value) database,
    required TResult Function(CryptoFailure value) crypto,
    required TResult Function(StorageFailure value) storage,
    required TResult Function(AuthFailure value) auth,
    required TResult Function(NotificationFailure value) notification,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(UnexpectedFailure value) unexpected,
  }) {
    return auth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DatabaseFailure value)? database,
    TResult? Function(CryptoFailure value)? crypto,
    TResult? Function(StorageFailure value)? storage,
    TResult? Function(AuthFailure value)? auth,
    TResult? Function(NotificationFailure value)? notification,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(UnexpectedFailure value)? unexpected,
  }) {
    return auth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DatabaseFailure value)? database,
    TResult Function(CryptoFailure value)? crypto,
    TResult Function(StorageFailure value)? storage,
    TResult Function(AuthFailure value)? auth,
    TResult Function(NotificationFailure value)? notification,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(UnexpectedFailure value)? unexpected,
    required TResult orElse(),
  }) {
    if (auth != null) {
      return auth(this);
    }
    return orElse();
  }
}

abstract class AuthFailure implements Failure {
  const factory AuthFailure({required final String message}) =
      _$AuthFailureImpl;

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthFailureImplCopyWith<_$AuthFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotificationFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$NotificationFailureImplCopyWith(_$NotificationFailureImpl value,
          $Res Function(_$NotificationFailureImpl) then) =
      __$$NotificationFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NotificationFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$NotificationFailureImpl>
    implements _$$NotificationFailureImplCopyWith<$Res> {
  __$$NotificationFailureImplCopyWithImpl(_$NotificationFailureImpl _value,
      $Res Function(_$NotificationFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$NotificationFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NotificationFailureImpl implements NotificationFailure {
  const _$NotificationFailureImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.notification(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationFailureImplCopyWith<_$NotificationFailureImpl> get copyWith =>
      __$$NotificationFailureImplCopyWithImpl<_$NotificationFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) database,
    required TResult Function(String message) crypto,
    required TResult Function(String message) storage,
    required TResult Function(String message) auth,
    required TResult Function(String message) notification,
    required TResult Function(String message) validation,
    required TResult Function(String message) unexpected,
  }) {
    return notification(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? database,
    TResult? Function(String message)? crypto,
    TResult? Function(String message)? storage,
    TResult? Function(String message)? auth,
    TResult? Function(String message)? notification,
    TResult? Function(String message)? validation,
    TResult? Function(String message)? unexpected,
  }) {
    return notification?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? database,
    TResult Function(String message)? crypto,
    TResult Function(String message)? storage,
    TResult Function(String message)? auth,
    TResult Function(String message)? notification,
    TResult Function(String message)? validation,
    TResult Function(String message)? unexpected,
    required TResult orElse(),
  }) {
    if (notification != null) {
      return notification(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DatabaseFailure value) database,
    required TResult Function(CryptoFailure value) crypto,
    required TResult Function(StorageFailure value) storage,
    required TResult Function(AuthFailure value) auth,
    required TResult Function(NotificationFailure value) notification,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(UnexpectedFailure value) unexpected,
  }) {
    return notification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DatabaseFailure value)? database,
    TResult? Function(CryptoFailure value)? crypto,
    TResult? Function(StorageFailure value)? storage,
    TResult? Function(AuthFailure value)? auth,
    TResult? Function(NotificationFailure value)? notification,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(UnexpectedFailure value)? unexpected,
  }) {
    return notification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DatabaseFailure value)? database,
    TResult Function(CryptoFailure value)? crypto,
    TResult Function(StorageFailure value)? storage,
    TResult Function(AuthFailure value)? auth,
    TResult Function(NotificationFailure value)? notification,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(UnexpectedFailure value)? unexpected,
    required TResult orElse(),
  }) {
    if (notification != null) {
      return notification(this);
    }
    return orElse();
  }
}

abstract class NotificationFailure implements Failure {
  const factory NotificationFailure({required final String message}) =
      _$NotificationFailureImpl;

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationFailureImplCopyWith<_$NotificationFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ValidationFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$ValidationFailureImplCopyWith(_$ValidationFailureImpl value,
          $Res Function(_$ValidationFailureImpl) then) =
      __$$ValidationFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ValidationFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$ValidationFailureImpl>
    implements _$$ValidationFailureImplCopyWith<$Res> {
  __$$ValidationFailureImplCopyWithImpl(_$ValidationFailureImpl _value,
      $Res Function(_$ValidationFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ValidationFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ValidationFailureImpl implements ValidationFailure {
  const _$ValidationFailureImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.validation(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidationFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidationFailureImplCopyWith<_$ValidationFailureImpl> get copyWith =>
      __$$ValidationFailureImplCopyWithImpl<_$ValidationFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) database,
    required TResult Function(String message) crypto,
    required TResult Function(String message) storage,
    required TResult Function(String message) auth,
    required TResult Function(String message) notification,
    required TResult Function(String message) validation,
    required TResult Function(String message) unexpected,
  }) {
    return validation(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? database,
    TResult? Function(String message)? crypto,
    TResult? Function(String message)? storage,
    TResult? Function(String message)? auth,
    TResult? Function(String message)? notification,
    TResult? Function(String message)? validation,
    TResult? Function(String message)? unexpected,
  }) {
    return validation?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? database,
    TResult Function(String message)? crypto,
    TResult Function(String message)? storage,
    TResult Function(String message)? auth,
    TResult Function(String message)? notification,
    TResult Function(String message)? validation,
    TResult Function(String message)? unexpected,
    required TResult orElse(),
  }) {
    if (validation != null) {
      return validation(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DatabaseFailure value) database,
    required TResult Function(CryptoFailure value) crypto,
    required TResult Function(StorageFailure value) storage,
    required TResult Function(AuthFailure value) auth,
    required TResult Function(NotificationFailure value) notification,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(UnexpectedFailure value) unexpected,
  }) {
    return validation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DatabaseFailure value)? database,
    TResult? Function(CryptoFailure value)? crypto,
    TResult? Function(StorageFailure value)? storage,
    TResult? Function(AuthFailure value)? auth,
    TResult? Function(NotificationFailure value)? notification,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(UnexpectedFailure value)? unexpected,
  }) {
    return validation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DatabaseFailure value)? database,
    TResult Function(CryptoFailure value)? crypto,
    TResult Function(StorageFailure value)? storage,
    TResult Function(AuthFailure value)? auth,
    TResult Function(NotificationFailure value)? notification,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(UnexpectedFailure value)? unexpected,
    required TResult orElse(),
  }) {
    if (validation != null) {
      return validation(this);
    }
    return orElse();
  }
}

abstract class ValidationFailure implements Failure {
  const factory ValidationFailure({required final String message}) =
      _$ValidationFailureImpl;

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ValidationFailureImplCopyWith<_$ValidationFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnexpectedFailureImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$UnexpectedFailureImplCopyWith(_$UnexpectedFailureImpl value,
          $Res Function(_$UnexpectedFailureImpl) then) =
      __$$UnexpectedFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UnexpectedFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$UnexpectedFailureImpl>
    implements _$$UnexpectedFailureImplCopyWith<$Res> {
  __$$UnexpectedFailureImplCopyWithImpl(_$UnexpectedFailureImpl _value,
      $Res Function(_$UnexpectedFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$UnexpectedFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UnexpectedFailureImpl implements UnexpectedFailure {
  const _$UnexpectedFailureImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.unexpected(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnexpectedFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnexpectedFailureImplCopyWith<_$UnexpectedFailureImpl> get copyWith =>
      __$$UnexpectedFailureImplCopyWithImpl<_$UnexpectedFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) database,
    required TResult Function(String message) crypto,
    required TResult Function(String message) storage,
    required TResult Function(String message) auth,
    required TResult Function(String message) notification,
    required TResult Function(String message) validation,
    required TResult Function(String message) unexpected,
  }) {
    return unexpected(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? database,
    TResult? Function(String message)? crypto,
    TResult? Function(String message)? storage,
    TResult? Function(String message)? auth,
    TResult? Function(String message)? notification,
    TResult? Function(String message)? validation,
    TResult? Function(String message)? unexpected,
  }) {
    return unexpected?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? database,
    TResult Function(String message)? crypto,
    TResult Function(String message)? storage,
    TResult Function(String message)? auth,
    TResult Function(String message)? notification,
    TResult Function(String message)? validation,
    TResult Function(String message)? unexpected,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DatabaseFailure value) database,
    required TResult Function(CryptoFailure value) crypto,
    required TResult Function(StorageFailure value) storage,
    required TResult Function(AuthFailure value) auth,
    required TResult Function(NotificationFailure value) notification,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(UnexpectedFailure value) unexpected,
  }) {
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DatabaseFailure value)? database,
    TResult? Function(CryptoFailure value)? crypto,
    TResult? Function(StorageFailure value)? storage,
    TResult? Function(AuthFailure value)? auth,
    TResult? Function(NotificationFailure value)? notification,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(UnexpectedFailure value)? unexpected,
  }) {
    return unexpected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DatabaseFailure value)? database,
    TResult Function(CryptoFailure value)? crypto,
    TResult Function(StorageFailure value)? storage,
    TResult Function(AuthFailure value)? auth,
    TResult Function(NotificationFailure value)? notification,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(UnexpectedFailure value)? unexpected,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class UnexpectedFailure implements Failure {
  const factory UnexpectedFailure({required final String message}) =
      _$UnexpectedFailureImpl;

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnexpectedFailureImplCopyWith<_$UnexpectedFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
