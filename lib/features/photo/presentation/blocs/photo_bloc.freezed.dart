// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photo_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PhotoEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadHistory,
    required TResult Function() capturePhoto,
    required TResult Function() pickFromGallery,
    required TResult Function(PhotoEntry entry) deletePhoto,
    required TResult Function(PhotoEntry entry) loadThumbnail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadHistory,
    TResult? Function()? capturePhoto,
    TResult? Function()? pickFromGallery,
    TResult? Function(PhotoEntry entry)? deletePhoto,
    TResult? Function(PhotoEntry entry)? loadThumbnail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadHistory,
    TResult Function()? capturePhoto,
    TResult Function()? pickFromGallery,
    TResult Function(PhotoEntry entry)? deletePhoto,
    TResult Function(PhotoEntry entry)? loadThumbnail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadHistory value) loadHistory,
    required TResult Function(_CapturePhoto value) capturePhoto,
    required TResult Function(_PickFromGallery value) pickFromGallery,
    required TResult Function(_DeletePhoto value) deletePhoto,
    required TResult Function(_LoadThumbnail value) loadThumbnail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadHistory value)? loadHistory,
    TResult? Function(_CapturePhoto value)? capturePhoto,
    TResult? Function(_PickFromGallery value)? pickFromGallery,
    TResult? Function(_DeletePhoto value)? deletePhoto,
    TResult? Function(_LoadThumbnail value)? loadThumbnail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadHistory value)? loadHistory,
    TResult Function(_CapturePhoto value)? capturePhoto,
    TResult Function(_PickFromGallery value)? pickFromGallery,
    TResult Function(_DeletePhoto value)? deletePhoto,
    TResult Function(_LoadThumbnail value)? loadThumbnail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoEventCopyWith<$Res> {
  factory $PhotoEventCopyWith(
          PhotoEvent value, $Res Function(PhotoEvent) then) =
      _$PhotoEventCopyWithImpl<$Res, PhotoEvent>;
}

/// @nodoc
class _$PhotoEventCopyWithImpl<$Res, $Val extends PhotoEvent>
    implements $PhotoEventCopyWith<$Res> {
  _$PhotoEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PhotoEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadHistoryImplCopyWith<$Res> {
  factory _$$LoadHistoryImplCopyWith(
          _$LoadHistoryImpl value, $Res Function(_$LoadHistoryImpl) then) =
      __$$LoadHistoryImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadHistoryImplCopyWithImpl<$Res>
    extends _$PhotoEventCopyWithImpl<$Res, _$LoadHistoryImpl>
    implements _$$LoadHistoryImplCopyWith<$Res> {
  __$$LoadHistoryImplCopyWithImpl(
      _$LoadHistoryImpl _value, $Res Function(_$LoadHistoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhotoEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadHistoryImpl with DiagnosticableTreeMixin implements _LoadHistory {
  const _$LoadHistoryImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PhotoEvent.loadHistory()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'PhotoEvent.loadHistory'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadHistoryImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadHistory,
    required TResult Function() capturePhoto,
    required TResult Function() pickFromGallery,
    required TResult Function(PhotoEntry entry) deletePhoto,
    required TResult Function(PhotoEntry entry) loadThumbnail,
  }) {
    return loadHistory();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadHistory,
    TResult? Function()? capturePhoto,
    TResult? Function()? pickFromGallery,
    TResult? Function(PhotoEntry entry)? deletePhoto,
    TResult? Function(PhotoEntry entry)? loadThumbnail,
  }) {
    return loadHistory?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadHistory,
    TResult Function()? capturePhoto,
    TResult Function()? pickFromGallery,
    TResult Function(PhotoEntry entry)? deletePhoto,
    TResult Function(PhotoEntry entry)? loadThumbnail,
    required TResult orElse(),
  }) {
    if (loadHistory != null) {
      return loadHistory();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadHistory value) loadHistory,
    required TResult Function(_CapturePhoto value) capturePhoto,
    required TResult Function(_PickFromGallery value) pickFromGallery,
    required TResult Function(_DeletePhoto value) deletePhoto,
    required TResult Function(_LoadThumbnail value) loadThumbnail,
  }) {
    return loadHistory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadHistory value)? loadHistory,
    TResult? Function(_CapturePhoto value)? capturePhoto,
    TResult? Function(_PickFromGallery value)? pickFromGallery,
    TResult? Function(_DeletePhoto value)? deletePhoto,
    TResult? Function(_LoadThumbnail value)? loadThumbnail,
  }) {
    return loadHistory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadHistory value)? loadHistory,
    TResult Function(_CapturePhoto value)? capturePhoto,
    TResult Function(_PickFromGallery value)? pickFromGallery,
    TResult Function(_DeletePhoto value)? deletePhoto,
    TResult Function(_LoadThumbnail value)? loadThumbnail,
    required TResult orElse(),
  }) {
    if (loadHistory != null) {
      return loadHistory(this);
    }
    return orElse();
  }
}

abstract class _LoadHistory implements PhotoEvent {
  const factory _LoadHistory() = _$LoadHistoryImpl;
}

/// @nodoc
abstract class _$$CapturePhotoImplCopyWith<$Res> {
  factory _$$CapturePhotoImplCopyWith(
          _$CapturePhotoImpl value, $Res Function(_$CapturePhotoImpl) then) =
      __$$CapturePhotoImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CapturePhotoImplCopyWithImpl<$Res>
    extends _$PhotoEventCopyWithImpl<$Res, _$CapturePhotoImpl>
    implements _$$CapturePhotoImplCopyWith<$Res> {
  __$$CapturePhotoImplCopyWithImpl(
      _$CapturePhotoImpl _value, $Res Function(_$CapturePhotoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhotoEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CapturePhotoImpl with DiagnosticableTreeMixin implements _CapturePhoto {
  const _$CapturePhotoImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PhotoEvent.capturePhoto()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'PhotoEvent.capturePhoto'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CapturePhotoImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadHistory,
    required TResult Function() capturePhoto,
    required TResult Function() pickFromGallery,
    required TResult Function(PhotoEntry entry) deletePhoto,
    required TResult Function(PhotoEntry entry) loadThumbnail,
  }) {
    return capturePhoto();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadHistory,
    TResult? Function()? capturePhoto,
    TResult? Function()? pickFromGallery,
    TResult? Function(PhotoEntry entry)? deletePhoto,
    TResult? Function(PhotoEntry entry)? loadThumbnail,
  }) {
    return capturePhoto?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadHistory,
    TResult Function()? capturePhoto,
    TResult Function()? pickFromGallery,
    TResult Function(PhotoEntry entry)? deletePhoto,
    TResult Function(PhotoEntry entry)? loadThumbnail,
    required TResult orElse(),
  }) {
    if (capturePhoto != null) {
      return capturePhoto();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadHistory value) loadHistory,
    required TResult Function(_CapturePhoto value) capturePhoto,
    required TResult Function(_PickFromGallery value) pickFromGallery,
    required TResult Function(_DeletePhoto value) deletePhoto,
    required TResult Function(_LoadThumbnail value) loadThumbnail,
  }) {
    return capturePhoto(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadHistory value)? loadHistory,
    TResult? Function(_CapturePhoto value)? capturePhoto,
    TResult? Function(_PickFromGallery value)? pickFromGallery,
    TResult? Function(_DeletePhoto value)? deletePhoto,
    TResult? Function(_LoadThumbnail value)? loadThumbnail,
  }) {
    return capturePhoto?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadHistory value)? loadHistory,
    TResult Function(_CapturePhoto value)? capturePhoto,
    TResult Function(_PickFromGallery value)? pickFromGallery,
    TResult Function(_DeletePhoto value)? deletePhoto,
    TResult Function(_LoadThumbnail value)? loadThumbnail,
    required TResult orElse(),
  }) {
    if (capturePhoto != null) {
      return capturePhoto(this);
    }
    return orElse();
  }
}

abstract class _CapturePhoto implements PhotoEvent {
  const factory _CapturePhoto() = _$CapturePhotoImpl;
}

/// @nodoc
abstract class _$$PickFromGalleryImplCopyWith<$Res> {
  factory _$$PickFromGalleryImplCopyWith(_$PickFromGalleryImpl value,
          $Res Function(_$PickFromGalleryImpl) then) =
      __$$PickFromGalleryImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PickFromGalleryImplCopyWithImpl<$Res>
    extends _$PhotoEventCopyWithImpl<$Res, _$PickFromGalleryImpl>
    implements _$$PickFromGalleryImplCopyWith<$Res> {
  __$$PickFromGalleryImplCopyWithImpl(
      _$PickFromGalleryImpl _value, $Res Function(_$PickFromGalleryImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhotoEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PickFromGalleryImpl
    with DiagnosticableTreeMixin
    implements _PickFromGallery {
  const _$PickFromGalleryImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PhotoEvent.pickFromGallery()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'PhotoEvent.pickFromGallery'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PickFromGalleryImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadHistory,
    required TResult Function() capturePhoto,
    required TResult Function() pickFromGallery,
    required TResult Function(PhotoEntry entry) deletePhoto,
    required TResult Function(PhotoEntry entry) loadThumbnail,
  }) {
    return pickFromGallery();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadHistory,
    TResult? Function()? capturePhoto,
    TResult? Function()? pickFromGallery,
    TResult? Function(PhotoEntry entry)? deletePhoto,
    TResult? Function(PhotoEntry entry)? loadThumbnail,
  }) {
    return pickFromGallery?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadHistory,
    TResult Function()? capturePhoto,
    TResult Function()? pickFromGallery,
    TResult Function(PhotoEntry entry)? deletePhoto,
    TResult Function(PhotoEntry entry)? loadThumbnail,
    required TResult orElse(),
  }) {
    if (pickFromGallery != null) {
      return pickFromGallery();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadHistory value) loadHistory,
    required TResult Function(_CapturePhoto value) capturePhoto,
    required TResult Function(_PickFromGallery value) pickFromGallery,
    required TResult Function(_DeletePhoto value) deletePhoto,
    required TResult Function(_LoadThumbnail value) loadThumbnail,
  }) {
    return pickFromGallery(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadHistory value)? loadHistory,
    TResult? Function(_CapturePhoto value)? capturePhoto,
    TResult? Function(_PickFromGallery value)? pickFromGallery,
    TResult? Function(_DeletePhoto value)? deletePhoto,
    TResult? Function(_LoadThumbnail value)? loadThumbnail,
  }) {
    return pickFromGallery?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadHistory value)? loadHistory,
    TResult Function(_CapturePhoto value)? capturePhoto,
    TResult Function(_PickFromGallery value)? pickFromGallery,
    TResult Function(_DeletePhoto value)? deletePhoto,
    TResult Function(_LoadThumbnail value)? loadThumbnail,
    required TResult orElse(),
  }) {
    if (pickFromGallery != null) {
      return pickFromGallery(this);
    }
    return orElse();
  }
}

abstract class _PickFromGallery implements PhotoEvent {
  const factory _PickFromGallery() = _$PickFromGalleryImpl;
}

/// @nodoc
abstract class _$$DeletePhotoImplCopyWith<$Res> {
  factory _$$DeletePhotoImplCopyWith(
          _$DeletePhotoImpl value, $Res Function(_$DeletePhotoImpl) then) =
      __$$DeletePhotoImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PhotoEntry entry});

  $PhotoEntryCopyWith<$Res> get entry;
}

/// @nodoc
class __$$DeletePhotoImplCopyWithImpl<$Res>
    extends _$PhotoEventCopyWithImpl<$Res, _$DeletePhotoImpl>
    implements _$$DeletePhotoImplCopyWith<$Res> {
  __$$DeletePhotoImplCopyWithImpl(
      _$DeletePhotoImpl _value, $Res Function(_$DeletePhotoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhotoEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entry = null,
  }) {
    return _then(_$DeletePhotoImpl(
      null == entry
          ? _value.entry
          : entry // ignore: cast_nullable_to_non_nullable
              as PhotoEntry,
    ));
  }

  /// Create a copy of PhotoEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PhotoEntryCopyWith<$Res> get entry {
    return $PhotoEntryCopyWith<$Res>(_value.entry, (value) {
      return _then(_value.copyWith(entry: value));
    });
  }
}

/// @nodoc

class _$DeletePhotoImpl with DiagnosticableTreeMixin implements _DeletePhoto {
  const _$DeletePhotoImpl(this.entry);

  @override
  final PhotoEntry entry;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PhotoEvent.deletePhoto(entry: $entry)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PhotoEvent.deletePhoto'))
      ..add(DiagnosticsProperty('entry', entry));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeletePhotoImpl &&
            (identical(other.entry, entry) || other.entry == entry));
  }

  @override
  int get hashCode => Object.hash(runtimeType, entry);

  /// Create a copy of PhotoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeletePhotoImplCopyWith<_$DeletePhotoImpl> get copyWith =>
      __$$DeletePhotoImplCopyWithImpl<_$DeletePhotoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadHistory,
    required TResult Function() capturePhoto,
    required TResult Function() pickFromGallery,
    required TResult Function(PhotoEntry entry) deletePhoto,
    required TResult Function(PhotoEntry entry) loadThumbnail,
  }) {
    return deletePhoto(entry);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadHistory,
    TResult? Function()? capturePhoto,
    TResult? Function()? pickFromGallery,
    TResult? Function(PhotoEntry entry)? deletePhoto,
    TResult? Function(PhotoEntry entry)? loadThumbnail,
  }) {
    return deletePhoto?.call(entry);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadHistory,
    TResult Function()? capturePhoto,
    TResult Function()? pickFromGallery,
    TResult Function(PhotoEntry entry)? deletePhoto,
    TResult Function(PhotoEntry entry)? loadThumbnail,
    required TResult orElse(),
  }) {
    if (deletePhoto != null) {
      return deletePhoto(entry);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadHistory value) loadHistory,
    required TResult Function(_CapturePhoto value) capturePhoto,
    required TResult Function(_PickFromGallery value) pickFromGallery,
    required TResult Function(_DeletePhoto value) deletePhoto,
    required TResult Function(_LoadThumbnail value) loadThumbnail,
  }) {
    return deletePhoto(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadHistory value)? loadHistory,
    TResult? Function(_CapturePhoto value)? capturePhoto,
    TResult? Function(_PickFromGallery value)? pickFromGallery,
    TResult? Function(_DeletePhoto value)? deletePhoto,
    TResult? Function(_LoadThumbnail value)? loadThumbnail,
  }) {
    return deletePhoto?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadHistory value)? loadHistory,
    TResult Function(_CapturePhoto value)? capturePhoto,
    TResult Function(_PickFromGallery value)? pickFromGallery,
    TResult Function(_DeletePhoto value)? deletePhoto,
    TResult Function(_LoadThumbnail value)? loadThumbnail,
    required TResult orElse(),
  }) {
    if (deletePhoto != null) {
      return deletePhoto(this);
    }
    return orElse();
  }
}

abstract class _DeletePhoto implements PhotoEvent {
  const factory _DeletePhoto(final PhotoEntry entry) = _$DeletePhotoImpl;

  PhotoEntry get entry;

  /// Create a copy of PhotoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeletePhotoImplCopyWith<_$DeletePhotoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadThumbnailImplCopyWith<$Res> {
  factory _$$LoadThumbnailImplCopyWith(
          _$LoadThumbnailImpl value, $Res Function(_$LoadThumbnailImpl) then) =
      __$$LoadThumbnailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PhotoEntry entry});

  $PhotoEntryCopyWith<$Res> get entry;
}

/// @nodoc
class __$$LoadThumbnailImplCopyWithImpl<$Res>
    extends _$PhotoEventCopyWithImpl<$Res, _$LoadThumbnailImpl>
    implements _$$LoadThumbnailImplCopyWith<$Res> {
  __$$LoadThumbnailImplCopyWithImpl(
      _$LoadThumbnailImpl _value, $Res Function(_$LoadThumbnailImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhotoEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entry = null,
  }) {
    return _then(_$LoadThumbnailImpl(
      null == entry
          ? _value.entry
          : entry // ignore: cast_nullable_to_non_nullable
              as PhotoEntry,
    ));
  }

  /// Create a copy of PhotoEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PhotoEntryCopyWith<$Res> get entry {
    return $PhotoEntryCopyWith<$Res>(_value.entry, (value) {
      return _then(_value.copyWith(entry: value));
    });
  }
}

/// @nodoc

class _$LoadThumbnailImpl
    with DiagnosticableTreeMixin
    implements _LoadThumbnail {
  const _$LoadThumbnailImpl(this.entry);

  @override
  final PhotoEntry entry;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PhotoEvent.loadThumbnail(entry: $entry)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PhotoEvent.loadThumbnail'))
      ..add(DiagnosticsProperty('entry', entry));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadThumbnailImpl &&
            (identical(other.entry, entry) || other.entry == entry));
  }

  @override
  int get hashCode => Object.hash(runtimeType, entry);

  /// Create a copy of PhotoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadThumbnailImplCopyWith<_$LoadThumbnailImpl> get copyWith =>
      __$$LoadThumbnailImplCopyWithImpl<_$LoadThumbnailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadHistory,
    required TResult Function() capturePhoto,
    required TResult Function() pickFromGallery,
    required TResult Function(PhotoEntry entry) deletePhoto,
    required TResult Function(PhotoEntry entry) loadThumbnail,
  }) {
    return loadThumbnail(entry);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadHistory,
    TResult? Function()? capturePhoto,
    TResult? Function()? pickFromGallery,
    TResult? Function(PhotoEntry entry)? deletePhoto,
    TResult? Function(PhotoEntry entry)? loadThumbnail,
  }) {
    return loadThumbnail?.call(entry);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadHistory,
    TResult Function()? capturePhoto,
    TResult Function()? pickFromGallery,
    TResult Function(PhotoEntry entry)? deletePhoto,
    TResult Function(PhotoEntry entry)? loadThumbnail,
    required TResult orElse(),
  }) {
    if (loadThumbnail != null) {
      return loadThumbnail(entry);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadHistory value) loadHistory,
    required TResult Function(_CapturePhoto value) capturePhoto,
    required TResult Function(_PickFromGallery value) pickFromGallery,
    required TResult Function(_DeletePhoto value) deletePhoto,
    required TResult Function(_LoadThumbnail value) loadThumbnail,
  }) {
    return loadThumbnail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadHistory value)? loadHistory,
    TResult? Function(_CapturePhoto value)? capturePhoto,
    TResult? Function(_PickFromGallery value)? pickFromGallery,
    TResult? Function(_DeletePhoto value)? deletePhoto,
    TResult? Function(_LoadThumbnail value)? loadThumbnail,
  }) {
    return loadThumbnail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadHistory value)? loadHistory,
    TResult Function(_CapturePhoto value)? capturePhoto,
    TResult Function(_PickFromGallery value)? pickFromGallery,
    TResult Function(_DeletePhoto value)? deletePhoto,
    TResult Function(_LoadThumbnail value)? loadThumbnail,
    required TResult orElse(),
  }) {
    if (loadThumbnail != null) {
      return loadThumbnail(this);
    }
    return orElse();
  }
}

abstract class _LoadThumbnail implements PhotoEvent {
  const factory _LoadThumbnail(final PhotoEntry entry) = _$LoadThumbnailImpl;

  PhotoEntry get entry;

  /// Create a copy of PhotoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadThumbnailImplCopyWith<_$LoadThumbnailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PhotoState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<PhotoEntry> entries, Map<String, Uint8List> thumbnailCache)
        loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<PhotoEntry> entries, Map<String, Uint8List> thumbnailCache)?
        loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<PhotoEntry> entries, Map<String, Uint8List> thumbnailCache)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoStateCopyWith<$Res> {
  factory $PhotoStateCopyWith(
          PhotoState value, $Res Function(PhotoState) then) =
      _$PhotoStateCopyWithImpl<$Res, PhotoState>;
}

/// @nodoc
class _$PhotoStateCopyWithImpl<$Res, $Val extends PhotoState>
    implements $PhotoStateCopyWith<$Res> {
  _$PhotoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PhotoState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$PhotoStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhotoState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl with DiagnosticableTreeMixin implements _Initial {
  const _$InitialImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PhotoState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'PhotoState.initial'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<PhotoEntry> entries, Map<String, Uint8List> thumbnailCache)
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
            List<PhotoEntry> entries, Map<String, Uint8List> thumbnailCache)?
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
            List<PhotoEntry> entries, Map<String, Uint8List> thumbnailCache)?
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements PhotoState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$PhotoStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhotoState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl with DiagnosticableTreeMixin implements _Loading {
  const _$LoadingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PhotoState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'PhotoState.loading'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<PhotoEntry> entries, Map<String, Uint8List> thumbnailCache)
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
            List<PhotoEntry> entries, Map<String, Uint8List> thumbnailCache)?
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
            List<PhotoEntry> entries, Map<String, Uint8List> thumbnailCache)?
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements PhotoState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<PhotoEntry> entries, Map<String, Uint8List> thumbnailCache});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$PhotoStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhotoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entries = null,
    Object? thumbnailCache = null,
  }) {
    return _then(_$LoadedImpl(
      entries: null == entries
          ? _value._entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<PhotoEntry>,
      thumbnailCache: null == thumbnailCache
          ? _value._thumbnailCache
          : thumbnailCache // ignore: cast_nullable_to_non_nullable
              as Map<String, Uint8List>,
    ));
  }
}

/// @nodoc

class _$LoadedImpl with DiagnosticableTreeMixin implements _Loaded {
  const _$LoadedImpl(
      {required final List<PhotoEntry> entries,
      required final Map<String, Uint8List> thumbnailCache})
      : _entries = entries,
        _thumbnailCache = thumbnailCache;

  final List<PhotoEntry> _entries;
  @override
  List<PhotoEntry> get entries {
    if (_entries is EqualUnmodifiableListView) return _entries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entries);
  }

  final Map<String, Uint8List> _thumbnailCache;
  @override
  Map<String, Uint8List> get thumbnailCache {
    if (_thumbnailCache is EqualUnmodifiableMapView) return _thumbnailCache;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_thumbnailCache);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PhotoState.loaded(entries: $entries, thumbnailCache: $thumbnailCache)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PhotoState.loaded'))
      ..add(DiagnosticsProperty('entries', entries))
      ..add(DiagnosticsProperty('thumbnailCache', thumbnailCache));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._entries, _entries) &&
            const DeepCollectionEquality()
                .equals(other._thumbnailCache, _thumbnailCache));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_entries),
      const DeepCollectionEquality().hash(_thumbnailCache));

  /// Create a copy of PhotoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<PhotoEntry> entries, Map<String, Uint8List> thumbnailCache)
        loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(entries, thumbnailCache);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<PhotoEntry> entries, Map<String, Uint8List> thumbnailCache)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(entries, thumbnailCache);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<PhotoEntry> entries, Map<String, Uint8List> thumbnailCache)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(entries, thumbnailCache);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements PhotoState {
  const factory _Loaded(
      {required final List<PhotoEntry> entries,
      required final Map<String, Uint8List> thumbnailCache}) = _$LoadedImpl;

  List<PhotoEntry> get entries;
  Map<String, Uint8List> get thumbnailCache;

  /// Create a copy of PhotoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$PhotoStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhotoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl with DiagnosticableTreeMixin implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PhotoState.error(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PhotoState.error'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of PhotoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<PhotoEntry> entries, Map<String, Uint8List> thumbnailCache)
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
            List<PhotoEntry> entries, Map<String, Uint8List> thumbnailCache)?
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
            List<PhotoEntry> entries, Map<String, Uint8List> thumbnailCache)?
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements PhotoState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of PhotoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
