// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Failure {
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FailureCopyWith<Failure> get copyWith =>
      _$FailureCopyWithImpl<Failure>(this as Failure, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Failure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'Failure(message: $message)';
  }
}

/// @nodoc
abstract mixin class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) _then) =
      _$FailureCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$FailureCopyWithImpl<$Res> implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._self, this._then);

  final Failure _self;
  final $Res Function(Failure) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_self.copyWith(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [Failure].
extension FailurePatterns on Failure {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DatabaseFailure value)? database,
    TResult Function(CryptoFailure value)? crypto,
    TResult Function(StorageFailure value)? storage,
    TResult Function(AuthFailure value)? auth,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(UnexpectedFailure value)? unexpected,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case DatabaseFailure() when database != null:
        return database(_that);
      case CryptoFailure() when crypto != null:
        return crypto(_that);
      case StorageFailure() when storage != null:
        return storage(_that);
      case AuthFailure() when auth != null:
        return auth(_that);
      case ValidationFailure() when validation != null:
        return validation(_that);
      case UnexpectedFailure() when unexpected != null:
        return unexpected(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DatabaseFailure value) database,
    required TResult Function(CryptoFailure value) crypto,
    required TResult Function(StorageFailure value) storage,
    required TResult Function(AuthFailure value) auth,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(UnexpectedFailure value) unexpected,
  }) {
    final _that = this;
    switch (_that) {
      case DatabaseFailure():
        return database(_that);
      case CryptoFailure():
        return crypto(_that);
      case StorageFailure():
        return storage(_that);
      case AuthFailure():
        return auth(_that);
      case ValidationFailure():
        return validation(_that);
      case UnexpectedFailure():
        return unexpected(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DatabaseFailure value)? database,
    TResult? Function(CryptoFailure value)? crypto,
    TResult? Function(StorageFailure value)? storage,
    TResult? Function(AuthFailure value)? auth,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(UnexpectedFailure value)? unexpected,
  }) {
    final _that = this;
    switch (_that) {
      case DatabaseFailure() when database != null:
        return database(_that);
      case CryptoFailure() when crypto != null:
        return crypto(_that);
      case StorageFailure() when storage != null:
        return storage(_that);
      case AuthFailure() when auth != null:
        return auth(_that);
      case ValidationFailure() when validation != null:
        return validation(_that);
      case UnexpectedFailure() when unexpected != null:
        return unexpected(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? database,
    TResult Function(String message)? crypto,
    TResult Function(String message)? storage,
    TResult Function(String message)? auth,
    TResult Function(String message)? validation,
    TResult Function(String message)? unexpected,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case DatabaseFailure() when database != null:
        return database(_that.message);
      case CryptoFailure() when crypto != null:
        return crypto(_that.message);
      case StorageFailure() when storage != null:
        return storage(_that.message);
      case AuthFailure() when auth != null:
        return auth(_that.message);
      case ValidationFailure() when validation != null:
        return validation(_that.message);
      case UnexpectedFailure() when unexpected != null:
        return unexpected(_that.message);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) database,
    required TResult Function(String message) crypto,
    required TResult Function(String message) storage,
    required TResult Function(String message) auth,
    required TResult Function(String message) validation,
    required TResult Function(String message) unexpected,
  }) {
    final _that = this;
    switch (_that) {
      case DatabaseFailure():
        return database(_that.message);
      case CryptoFailure():
        return crypto(_that.message);
      case StorageFailure():
        return storage(_that.message);
      case AuthFailure():
        return auth(_that.message);
      case ValidationFailure():
        return validation(_that.message);
      case UnexpectedFailure():
        return unexpected(_that.message);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? database,
    TResult? Function(String message)? crypto,
    TResult? Function(String message)? storage,
    TResult? Function(String message)? auth,
    TResult? Function(String message)? validation,
    TResult? Function(String message)? unexpected,
  }) {
    final _that = this;
    switch (_that) {
      case DatabaseFailure() when database != null:
        return database(_that.message);
      case CryptoFailure() when crypto != null:
        return crypto(_that.message);
      case StorageFailure() when storage != null:
        return storage(_that.message);
      case AuthFailure() when auth != null:
        return auth(_that.message);
      case ValidationFailure() when validation != null:
        return validation(_that.message);
      case UnexpectedFailure() when unexpected != null:
        return unexpected(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class DatabaseFailure implements Failure {
  const DatabaseFailure({required this.message});

  @override
  final String message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DatabaseFailureCopyWith<DatabaseFailure> get copyWith =>
      _$DatabaseFailureCopyWithImpl<DatabaseFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DatabaseFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'Failure.database(message: $message)';
  }
}

/// @nodoc
abstract mixin class $DatabaseFailureCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory $DatabaseFailureCopyWith(
          DatabaseFailure value, $Res Function(DatabaseFailure) _then) =
      _$DatabaseFailureCopyWithImpl;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$DatabaseFailureCopyWithImpl<$Res>
    implements $DatabaseFailureCopyWith<$Res> {
  _$DatabaseFailureCopyWithImpl(this._self, this._then);

  final DatabaseFailure _self;
  final $Res Function(DatabaseFailure) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(DatabaseFailure(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class CryptoFailure implements Failure {
  const CryptoFailure({required this.message});

  @override
  final String message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CryptoFailureCopyWith<CryptoFailure> get copyWith =>
      _$CryptoFailureCopyWithImpl<CryptoFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CryptoFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'Failure.crypto(message: $message)';
  }
}

/// @nodoc
abstract mixin class $CryptoFailureCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory $CryptoFailureCopyWith(
          CryptoFailure value, $Res Function(CryptoFailure) _then) =
      _$CryptoFailureCopyWithImpl;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$CryptoFailureCopyWithImpl<$Res>
    implements $CryptoFailureCopyWith<$Res> {
  _$CryptoFailureCopyWithImpl(this._self, this._then);

  final CryptoFailure _self;
  final $Res Function(CryptoFailure) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(CryptoFailure(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class StorageFailure implements Failure {
  const StorageFailure({required this.message});

  @override
  final String message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StorageFailureCopyWith<StorageFailure> get copyWith =>
      _$StorageFailureCopyWithImpl<StorageFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StorageFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'Failure.storage(message: $message)';
  }
}

/// @nodoc
abstract mixin class $StorageFailureCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory $StorageFailureCopyWith(
          StorageFailure value, $Res Function(StorageFailure) _then) =
      _$StorageFailureCopyWithImpl;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$StorageFailureCopyWithImpl<$Res>
    implements $StorageFailureCopyWith<$Res> {
  _$StorageFailureCopyWithImpl(this._self, this._then);

  final StorageFailure _self;
  final $Res Function(StorageFailure) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(StorageFailure(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class AuthFailure implements Failure {
  const AuthFailure({required this.message});

  @override
  final String message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthFailureCopyWith<AuthFailure> get copyWith =>
      _$AuthFailureCopyWithImpl<AuthFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'Failure.auth(message: $message)';
  }
}

/// @nodoc
abstract mixin class $AuthFailureCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory $AuthFailureCopyWith(
          AuthFailure value, $Res Function(AuthFailure) _then) =
      _$AuthFailureCopyWithImpl;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$AuthFailureCopyWithImpl<$Res> implements $AuthFailureCopyWith<$Res> {
  _$AuthFailureCopyWithImpl(this._self, this._then);

  final AuthFailure _self;
  final $Res Function(AuthFailure) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(AuthFailure(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class ValidationFailure implements Failure {
  const ValidationFailure({required this.message});

  @override
  final String message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ValidationFailureCopyWith<ValidationFailure> get copyWith =>
      _$ValidationFailureCopyWithImpl<ValidationFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ValidationFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'Failure.validation(message: $message)';
  }
}

/// @nodoc
abstract mixin class $ValidationFailureCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory $ValidationFailureCopyWith(
          ValidationFailure value, $Res Function(ValidationFailure) _then) =
      _$ValidationFailureCopyWithImpl;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$ValidationFailureCopyWithImpl<$Res>
    implements $ValidationFailureCopyWith<$Res> {
  _$ValidationFailureCopyWithImpl(this._self, this._then);

  final ValidationFailure _self;
  final $Res Function(ValidationFailure) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(ValidationFailure(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class UnexpectedFailure implements Failure {
  const UnexpectedFailure({required this.message});

  @override
  final String message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UnexpectedFailureCopyWith<UnexpectedFailure> get copyWith =>
      _$UnexpectedFailureCopyWithImpl<UnexpectedFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UnexpectedFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'Failure.unexpected(message: $message)';
  }
}

/// @nodoc
abstract mixin class $UnexpectedFailureCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory $UnexpectedFailureCopyWith(
          UnexpectedFailure value, $Res Function(UnexpectedFailure) _then) =
      _$UnexpectedFailureCopyWithImpl;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$UnexpectedFailureCopyWithImpl<$Res>
    implements $UnexpectedFailureCopyWith<$Res> {
  _$UnexpectedFailureCopyWithImpl(this._self, this._then);

  final UnexpectedFailure _self;
  final $Res Function(UnexpectedFailure) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(UnexpectedFailure(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
