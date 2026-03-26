// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'record_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RecordState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            int journalStreak,
            DateTime? lastJournalDate,
            DateTime? lastPhotoDate,
            DateTime? lastMeasurementDate,
            String? lastMeasurementSummary)
        loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            int journalStreak,
            DateTime? lastJournalDate,
            DateTime? lastPhotoDate,
            DateTime? lastMeasurementDate,
            String? lastMeasurementSummary)?
        loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            int journalStreak,
            DateTime? lastJournalDate,
            DateTime? lastPhotoDate,
            DateTime? lastMeasurementDate,
            String? lastMeasurementSummary)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RecordInitial value) initial,
    required TResult Function(RecordLoading value) loading,
    required TResult Function(RecordLoaded value) loaded,
    required TResult Function(RecordError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RecordInitial value)? initial,
    TResult? Function(RecordLoading value)? loading,
    TResult? Function(RecordLoaded value)? loaded,
    TResult? Function(RecordError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RecordInitial value)? initial,
    TResult Function(RecordLoading value)? loading,
    TResult Function(RecordLoaded value)? loaded,
    TResult Function(RecordError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordStateCopyWith<$Res> {
  factory $RecordStateCopyWith(
          RecordState value, $Res Function(RecordState) then) =
      _$RecordStateCopyWithImpl<$Res, RecordState>;
}

/// @nodoc
class _$RecordStateCopyWithImpl<$Res, $Val extends RecordState>
    implements $RecordStateCopyWith<$Res> {
  _$RecordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecordState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$RecordInitialImplCopyWith<$Res> {
  factory _$$RecordInitialImplCopyWith(
          _$RecordInitialImpl value, $Res Function(_$RecordInitialImpl) then) =
      __$$RecordInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RecordInitialImplCopyWithImpl<$Res>
    extends _$RecordStateCopyWithImpl<$Res, _$RecordInitialImpl>
    implements _$$RecordInitialImplCopyWith<$Res> {
  __$$RecordInitialImplCopyWithImpl(
      _$RecordInitialImpl _value, $Res Function(_$RecordInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecordState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RecordInitialImpl implements RecordInitial {
  const _$RecordInitialImpl();

  @override
  String toString() {
    return 'RecordState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RecordInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            int journalStreak,
            DateTime? lastJournalDate,
            DateTime? lastPhotoDate,
            DateTime? lastMeasurementDate,
            String? lastMeasurementSummary)
        loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            int journalStreak,
            DateTime? lastJournalDate,
            DateTime? lastPhotoDate,
            DateTime? lastMeasurementDate,
            String? lastMeasurementSummary)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            int journalStreak,
            DateTime? lastJournalDate,
            DateTime? lastPhotoDate,
            DateTime? lastMeasurementDate,
            String? lastMeasurementSummary)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RecordInitial value) initial,
    required TResult Function(RecordLoading value) loading,
    required TResult Function(RecordLoaded value) loaded,
    required TResult Function(RecordError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RecordInitial value)? initial,
    TResult? Function(RecordLoading value)? loading,
    TResult? Function(RecordLoaded value)? loaded,
    TResult? Function(RecordError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RecordInitial value)? initial,
    TResult Function(RecordLoading value)? loading,
    TResult Function(RecordLoaded value)? loaded,
    TResult Function(RecordError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class RecordInitial implements RecordState {
  const factory RecordInitial() = _$RecordInitialImpl;
}

/// @nodoc
abstract class _$$RecordLoadingImplCopyWith<$Res> {
  factory _$$RecordLoadingImplCopyWith(
          _$RecordLoadingImpl value, $Res Function(_$RecordLoadingImpl) then) =
      __$$RecordLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RecordLoadingImplCopyWithImpl<$Res>
    extends _$RecordStateCopyWithImpl<$Res, _$RecordLoadingImpl>
    implements _$$RecordLoadingImplCopyWith<$Res> {
  __$$RecordLoadingImplCopyWithImpl(
      _$RecordLoadingImpl _value, $Res Function(_$RecordLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecordState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RecordLoadingImpl implements RecordLoading {
  const _$RecordLoadingImpl();

  @override
  String toString() {
    return 'RecordState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RecordLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            int journalStreak,
            DateTime? lastJournalDate,
            DateTime? lastPhotoDate,
            DateTime? lastMeasurementDate,
            String? lastMeasurementSummary)
        loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            int journalStreak,
            DateTime? lastJournalDate,
            DateTime? lastPhotoDate,
            DateTime? lastMeasurementDate,
            String? lastMeasurementSummary)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            int journalStreak,
            DateTime? lastJournalDate,
            DateTime? lastPhotoDate,
            DateTime? lastMeasurementDate,
            String? lastMeasurementSummary)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RecordInitial value) initial,
    required TResult Function(RecordLoading value) loading,
    required TResult Function(RecordLoaded value) loaded,
    required TResult Function(RecordError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RecordInitial value)? initial,
    TResult? Function(RecordLoading value)? loading,
    TResult? Function(RecordLoaded value)? loaded,
    TResult? Function(RecordError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RecordInitial value)? initial,
    TResult Function(RecordLoading value)? loading,
    TResult Function(RecordLoaded value)? loaded,
    TResult Function(RecordError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class RecordLoading implements RecordState {
  const factory RecordLoading() = _$RecordLoadingImpl;
}

/// @nodoc
abstract class _$$RecordLoadedImplCopyWith<$Res> {
  factory _$$RecordLoadedImplCopyWith(
          _$RecordLoadedImpl value, $Res Function(_$RecordLoadedImpl) then) =
      __$$RecordLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int journalStreak,
      DateTime? lastJournalDate,
      DateTime? lastPhotoDate,
      DateTime? lastMeasurementDate,
      String? lastMeasurementSummary});
}

/// @nodoc
class __$$RecordLoadedImplCopyWithImpl<$Res>
    extends _$RecordStateCopyWithImpl<$Res, _$RecordLoadedImpl>
    implements _$$RecordLoadedImplCopyWith<$Res> {
  __$$RecordLoadedImplCopyWithImpl(
      _$RecordLoadedImpl _value, $Res Function(_$RecordLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecordState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? journalStreak = null,
    Object? lastJournalDate = freezed,
    Object? lastPhotoDate = freezed,
    Object? lastMeasurementDate = freezed,
    Object? lastMeasurementSummary = freezed,
  }) {
    return _then(_$RecordLoadedImpl(
      journalStreak: null == journalStreak
          ? _value.journalStreak
          : journalStreak // ignore: cast_nullable_to_non_nullable
              as int,
      lastJournalDate: freezed == lastJournalDate
          ? _value.lastJournalDate
          : lastJournalDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastPhotoDate: freezed == lastPhotoDate
          ? _value.lastPhotoDate
          : lastPhotoDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastMeasurementDate: freezed == lastMeasurementDate
          ? _value.lastMeasurementDate
          : lastMeasurementDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastMeasurementSummary: freezed == lastMeasurementSummary
          ? _value.lastMeasurementSummary
          : lastMeasurementSummary // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$RecordLoadedImpl implements RecordLoaded {
  const _$RecordLoadedImpl(
      {required this.journalStreak,
      required this.lastJournalDate,
      required this.lastPhotoDate,
      required this.lastMeasurementDate,
      required this.lastMeasurementSummary});

  @override
  final int journalStreak;
  @override
  final DateTime? lastJournalDate;
  @override
  final DateTime? lastPhotoDate;
// null for now (Phase 2)
  @override
  final DateTime? lastMeasurementDate;
// null for now (Phase 2)
  @override
  final String? lastMeasurementSummary;

  @override
  String toString() {
    return 'RecordState.loaded(journalStreak: $journalStreak, lastJournalDate: $lastJournalDate, lastPhotoDate: $lastPhotoDate, lastMeasurementDate: $lastMeasurementDate, lastMeasurementSummary: $lastMeasurementSummary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordLoadedImpl &&
            (identical(other.journalStreak, journalStreak) ||
                other.journalStreak == journalStreak) &&
            (identical(other.lastJournalDate, lastJournalDate) ||
                other.lastJournalDate == lastJournalDate) &&
            (identical(other.lastPhotoDate, lastPhotoDate) ||
                other.lastPhotoDate == lastPhotoDate) &&
            (identical(other.lastMeasurementDate, lastMeasurementDate) ||
                other.lastMeasurementDate == lastMeasurementDate) &&
            (identical(other.lastMeasurementSummary, lastMeasurementSummary) ||
                other.lastMeasurementSummary == lastMeasurementSummary));
  }

  @override
  int get hashCode => Object.hash(runtimeType, journalStreak, lastJournalDate,
      lastPhotoDate, lastMeasurementDate, lastMeasurementSummary);

  /// Create a copy of RecordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordLoadedImplCopyWith<_$RecordLoadedImpl> get copyWith =>
      __$$RecordLoadedImplCopyWithImpl<_$RecordLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            int journalStreak,
            DateTime? lastJournalDate,
            DateTime? lastPhotoDate,
            DateTime? lastMeasurementDate,
            String? lastMeasurementSummary)
        loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(journalStreak, lastJournalDate, lastPhotoDate,
        lastMeasurementDate, lastMeasurementSummary);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            int journalStreak,
            DateTime? lastJournalDate,
            DateTime? lastPhotoDate,
            DateTime? lastMeasurementDate,
            String? lastMeasurementSummary)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(journalStreak, lastJournalDate, lastPhotoDate,
        lastMeasurementDate, lastMeasurementSummary);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            int journalStreak,
            DateTime? lastJournalDate,
            DateTime? lastPhotoDate,
            DateTime? lastMeasurementDate,
            String? lastMeasurementSummary)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(journalStreak, lastJournalDate, lastPhotoDate,
          lastMeasurementDate, lastMeasurementSummary);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RecordInitial value) initial,
    required TResult Function(RecordLoading value) loading,
    required TResult Function(RecordLoaded value) loaded,
    required TResult Function(RecordError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RecordInitial value)? initial,
    TResult? Function(RecordLoading value)? loading,
    TResult? Function(RecordLoaded value)? loaded,
    TResult? Function(RecordError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RecordInitial value)? initial,
    TResult Function(RecordLoading value)? loading,
    TResult Function(RecordLoaded value)? loaded,
    TResult Function(RecordError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class RecordLoaded implements RecordState {
  const factory RecordLoaded(
      {required final int journalStreak,
      required final DateTime? lastJournalDate,
      required final DateTime? lastPhotoDate,
      required final DateTime? lastMeasurementDate,
      required final String? lastMeasurementSummary}) = _$RecordLoadedImpl;

  int get journalStreak;
  DateTime? get lastJournalDate;
  DateTime? get lastPhotoDate; // null for now (Phase 2)
  DateTime? get lastMeasurementDate; // null for now (Phase 2)
  String? get lastMeasurementSummary;

  /// Create a copy of RecordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecordLoadedImplCopyWith<_$RecordLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RecordErrorImplCopyWith<$Res> {
  factory _$$RecordErrorImplCopyWith(
          _$RecordErrorImpl value, $Res Function(_$RecordErrorImpl) then) =
      __$$RecordErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$RecordErrorImplCopyWithImpl<$Res>
    extends _$RecordStateCopyWithImpl<$Res, _$RecordErrorImpl>
    implements _$$RecordErrorImplCopyWith<$Res> {
  __$$RecordErrorImplCopyWithImpl(
      _$RecordErrorImpl _value, $Res Function(_$RecordErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecordState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$RecordErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RecordErrorImpl implements RecordError {
  const _$RecordErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'RecordState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of RecordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordErrorImplCopyWith<_$RecordErrorImpl> get copyWith =>
      __$$RecordErrorImplCopyWithImpl<_$RecordErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            int journalStreak,
            DateTime? lastJournalDate,
            DateTime? lastPhotoDate,
            DateTime? lastMeasurementDate,
            String? lastMeasurementSummary)
        loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            int journalStreak,
            DateTime? lastJournalDate,
            DateTime? lastPhotoDate,
            DateTime? lastMeasurementDate,
            String? lastMeasurementSummary)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            int journalStreak,
            DateTime? lastJournalDate,
            DateTime? lastPhotoDate,
            DateTime? lastMeasurementDate,
            String? lastMeasurementSummary)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RecordInitial value) initial,
    required TResult Function(RecordLoading value) loading,
    required TResult Function(RecordLoaded value) loaded,
    required TResult Function(RecordError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RecordInitial value)? initial,
    TResult? Function(RecordLoading value)? loading,
    TResult? Function(RecordLoaded value)? loaded,
    TResult? Function(RecordError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RecordInitial value)? initial,
    TResult Function(RecordLoading value)? loading,
    TResult Function(RecordLoaded value)? loaded,
    TResult Function(RecordError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class RecordError implements RecordState {
  const factory RecordError(final String message) = _$RecordErrorImpl;

  String get message;

  /// Create a copy of RecordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecordErrorImplCopyWith<_$RecordErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
