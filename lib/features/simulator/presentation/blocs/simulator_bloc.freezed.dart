// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'simulator_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SimulatorEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(DosingRegimen regimen) regimenUpdated,
    required TResult Function(EsterType esterType) esterTypeChanged,
    required TResult Function() engineToggled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(DosingRegimen regimen)? regimenUpdated,
    TResult? Function(EsterType esterType)? esterTypeChanged,
    TResult? Function()? engineToggled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(DosingRegimen regimen)? regimenUpdated,
    TResult Function(EsterType esterType)? esterTypeChanged,
    TResult Function()? engineToggled,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_RegimenUpdated value) regimenUpdated,
    required TResult Function(_EsterTypeChanged value) esterTypeChanged,
    required TResult Function(_EngineToggled value) engineToggled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_RegimenUpdated value)? regimenUpdated,
    TResult? Function(_EsterTypeChanged value)? esterTypeChanged,
    TResult? Function(_EngineToggled value)? engineToggled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_RegimenUpdated value)? regimenUpdated,
    TResult Function(_EsterTypeChanged value)? esterTypeChanged,
    TResult Function(_EngineToggled value)? engineToggled,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SimulatorEventCopyWith<$Res> {
  factory $SimulatorEventCopyWith(
          SimulatorEvent value, $Res Function(SimulatorEvent) then) =
      _$SimulatorEventCopyWithImpl<$Res, SimulatorEvent>;
}

/// @nodoc
class _$SimulatorEventCopyWithImpl<$Res, $Val extends SimulatorEvent>
    implements $SimulatorEventCopyWith<$Res> {
  _$SimulatorEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SimulatorEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$SimulatorEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SimulatorEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'SimulatorEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(DosingRegimen regimen) regimenUpdated,
    required TResult Function(EsterType esterType) esterTypeChanged,
    required TResult Function() engineToggled,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(DosingRegimen regimen)? regimenUpdated,
    TResult? Function(EsterType esterType)? esterTypeChanged,
    TResult? Function()? engineToggled,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(DosingRegimen regimen)? regimenUpdated,
    TResult Function(EsterType esterType)? esterTypeChanged,
    TResult Function()? engineToggled,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_RegimenUpdated value) regimenUpdated,
    required TResult Function(_EsterTypeChanged value) esterTypeChanged,
    required TResult Function(_EngineToggled value) engineToggled,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_RegimenUpdated value)? regimenUpdated,
    TResult? Function(_EsterTypeChanged value)? esterTypeChanged,
    TResult? Function(_EngineToggled value)? engineToggled,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_RegimenUpdated value)? regimenUpdated,
    TResult Function(_EsterTypeChanged value)? esterTypeChanged,
    TResult Function(_EngineToggled value)? engineToggled,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements SimulatorEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$RegimenUpdatedImplCopyWith<$Res> {
  factory _$$RegimenUpdatedImplCopyWith(_$RegimenUpdatedImpl value,
          $Res Function(_$RegimenUpdatedImpl) then) =
      __$$RegimenUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DosingRegimen regimen});

  $DosingRegimenCopyWith<$Res> get regimen;
}

/// @nodoc
class __$$RegimenUpdatedImplCopyWithImpl<$Res>
    extends _$SimulatorEventCopyWithImpl<$Res, _$RegimenUpdatedImpl>
    implements _$$RegimenUpdatedImplCopyWith<$Res> {
  __$$RegimenUpdatedImplCopyWithImpl(
      _$RegimenUpdatedImpl _value, $Res Function(_$RegimenUpdatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SimulatorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? regimen = null,
  }) {
    return _then(_$RegimenUpdatedImpl(
      regimen: null == regimen
          ? _value.regimen
          : regimen // ignore: cast_nullable_to_non_nullable
              as DosingRegimen,
    ));
  }

  /// Create a copy of SimulatorEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DosingRegimenCopyWith<$Res> get regimen {
    return $DosingRegimenCopyWith<$Res>(_value.regimen, (value) {
      return _then(_value.copyWith(regimen: value));
    });
  }
}

/// @nodoc

class _$RegimenUpdatedImpl implements _RegimenUpdated {
  const _$RegimenUpdatedImpl({required this.regimen});

  @override
  final DosingRegimen regimen;

  @override
  String toString() {
    return 'SimulatorEvent.regimenUpdated(regimen: $regimen)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegimenUpdatedImpl &&
            (identical(other.regimen, regimen) || other.regimen == regimen));
  }

  @override
  int get hashCode => Object.hash(runtimeType, regimen);

  /// Create a copy of SimulatorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegimenUpdatedImplCopyWith<_$RegimenUpdatedImpl> get copyWith =>
      __$$RegimenUpdatedImplCopyWithImpl<_$RegimenUpdatedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(DosingRegimen regimen) regimenUpdated,
    required TResult Function(EsterType esterType) esterTypeChanged,
    required TResult Function() engineToggled,
  }) {
    return regimenUpdated(regimen);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(DosingRegimen regimen)? regimenUpdated,
    TResult? Function(EsterType esterType)? esterTypeChanged,
    TResult? Function()? engineToggled,
  }) {
    return regimenUpdated?.call(regimen);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(DosingRegimen regimen)? regimenUpdated,
    TResult Function(EsterType esterType)? esterTypeChanged,
    TResult Function()? engineToggled,
    required TResult orElse(),
  }) {
    if (regimenUpdated != null) {
      return regimenUpdated(regimen);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_RegimenUpdated value) regimenUpdated,
    required TResult Function(_EsterTypeChanged value) esterTypeChanged,
    required TResult Function(_EngineToggled value) engineToggled,
  }) {
    return regimenUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_RegimenUpdated value)? regimenUpdated,
    TResult? Function(_EsterTypeChanged value)? esterTypeChanged,
    TResult? Function(_EngineToggled value)? engineToggled,
  }) {
    return regimenUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_RegimenUpdated value)? regimenUpdated,
    TResult Function(_EsterTypeChanged value)? esterTypeChanged,
    TResult Function(_EngineToggled value)? engineToggled,
    required TResult orElse(),
  }) {
    if (regimenUpdated != null) {
      return regimenUpdated(this);
    }
    return orElse();
  }
}

abstract class _RegimenUpdated implements SimulatorEvent {
  const factory _RegimenUpdated({required final DosingRegimen regimen}) =
      _$RegimenUpdatedImpl;

  DosingRegimen get regimen;

  /// Create a copy of SimulatorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegimenUpdatedImplCopyWith<_$RegimenUpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EsterTypeChangedImplCopyWith<$Res> {
  factory _$$EsterTypeChangedImplCopyWith(_$EsterTypeChangedImpl value,
          $Res Function(_$EsterTypeChangedImpl) then) =
      __$$EsterTypeChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({EsterType esterType});
}

/// @nodoc
class __$$EsterTypeChangedImplCopyWithImpl<$Res>
    extends _$SimulatorEventCopyWithImpl<$Res, _$EsterTypeChangedImpl>
    implements _$$EsterTypeChangedImplCopyWith<$Res> {
  __$$EsterTypeChangedImplCopyWithImpl(_$EsterTypeChangedImpl _value,
      $Res Function(_$EsterTypeChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SimulatorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? esterType = null,
  }) {
    return _then(_$EsterTypeChangedImpl(
      esterType: null == esterType
          ? _value.esterType
          : esterType // ignore: cast_nullable_to_non_nullable
              as EsterType,
    ));
  }
}

/// @nodoc

class _$EsterTypeChangedImpl implements _EsterTypeChanged {
  const _$EsterTypeChangedImpl({required this.esterType});

  @override
  final EsterType esterType;

  @override
  String toString() {
    return 'SimulatorEvent.esterTypeChanged(esterType: $esterType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EsterTypeChangedImpl &&
            (identical(other.esterType, esterType) ||
                other.esterType == esterType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, esterType);

  /// Create a copy of SimulatorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EsterTypeChangedImplCopyWith<_$EsterTypeChangedImpl> get copyWith =>
      __$$EsterTypeChangedImplCopyWithImpl<_$EsterTypeChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(DosingRegimen regimen) regimenUpdated,
    required TResult Function(EsterType esterType) esterTypeChanged,
    required TResult Function() engineToggled,
  }) {
    return esterTypeChanged(esterType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(DosingRegimen regimen)? regimenUpdated,
    TResult? Function(EsterType esterType)? esterTypeChanged,
    TResult? Function()? engineToggled,
  }) {
    return esterTypeChanged?.call(esterType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(DosingRegimen regimen)? regimenUpdated,
    TResult Function(EsterType esterType)? esterTypeChanged,
    TResult Function()? engineToggled,
    required TResult orElse(),
  }) {
    if (esterTypeChanged != null) {
      return esterTypeChanged(esterType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_RegimenUpdated value) regimenUpdated,
    required TResult Function(_EsterTypeChanged value) esterTypeChanged,
    required TResult Function(_EngineToggled value) engineToggled,
  }) {
    return esterTypeChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_RegimenUpdated value)? regimenUpdated,
    TResult? Function(_EsterTypeChanged value)? esterTypeChanged,
    TResult? Function(_EngineToggled value)? engineToggled,
  }) {
    return esterTypeChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_RegimenUpdated value)? regimenUpdated,
    TResult Function(_EsterTypeChanged value)? esterTypeChanged,
    TResult Function(_EngineToggled value)? engineToggled,
    required TResult orElse(),
  }) {
    if (esterTypeChanged != null) {
      return esterTypeChanged(this);
    }
    return orElse();
  }
}

abstract class _EsterTypeChanged implements SimulatorEvent {
  const factory _EsterTypeChanged({required final EsterType esterType}) =
      _$EsterTypeChangedImpl;

  EsterType get esterType;

  /// Create a copy of SimulatorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EsterTypeChangedImplCopyWith<_$EsterTypeChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EngineToggledImplCopyWith<$Res> {
  factory _$$EngineToggledImplCopyWith(
          _$EngineToggledImpl value, $Res Function(_$EngineToggledImpl) then) =
      __$$EngineToggledImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EngineToggledImplCopyWithImpl<$Res>
    extends _$SimulatorEventCopyWithImpl<$Res, _$EngineToggledImpl>
    implements _$$EngineToggledImplCopyWith<$Res> {
  __$$EngineToggledImplCopyWithImpl(
      _$EngineToggledImpl _value, $Res Function(_$EngineToggledImpl) _then)
      : super(_value, _then);

  /// Create a copy of SimulatorEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$EngineToggledImpl implements _EngineToggled {
  const _$EngineToggledImpl();

  @override
  String toString() {
    return 'SimulatorEvent.engineToggled()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EngineToggledImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(DosingRegimen regimen) regimenUpdated,
    required TResult Function(EsterType esterType) esterTypeChanged,
    required TResult Function() engineToggled,
  }) {
    return engineToggled();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(DosingRegimen regimen)? regimenUpdated,
    TResult? Function(EsterType esterType)? esterTypeChanged,
    TResult? Function()? engineToggled,
  }) {
    return engineToggled?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(DosingRegimen regimen)? regimenUpdated,
    TResult Function(EsterType esterType)? esterTypeChanged,
    TResult Function()? engineToggled,
    required TResult orElse(),
  }) {
    if (engineToggled != null) {
      return engineToggled();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_RegimenUpdated value) regimenUpdated,
    required TResult Function(_EsterTypeChanged value) esterTypeChanged,
    required TResult Function(_EngineToggled value) engineToggled,
  }) {
    return engineToggled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_RegimenUpdated value)? regimenUpdated,
    TResult? Function(_EsterTypeChanged value)? esterTypeChanged,
    TResult? Function(_EngineToggled value)? engineToggled,
  }) {
    return engineToggled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_RegimenUpdated value)? regimenUpdated,
    TResult Function(_EsterTypeChanged value)? esterTypeChanged,
    TResult Function(_EngineToggled value)? engineToggled,
    required TResult orElse(),
  }) {
    if (engineToggled != null) {
      return engineToggled(this);
    }
    return orElse();
  }
}

abstract class _EngineToggled implements SimulatorEvent {
  const factory _EngineToggled() = _$EngineToggledImpl;
}

/// @nodoc
mixin _$SimulatorState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(PkSimulationResult result, DosingRegimen regimen,
            bool isHanaPk, PkSimulationResult? hanaPkResult)
        loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PkSimulationResult result, DosingRegimen regimen,
            bool isHanaPk, PkSimulationResult? hanaPkResult)?
        loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PkSimulationResult result, DosingRegimen regimen,
            bool isHanaPk, PkSimulationResult? hanaPkResult)?
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
abstract class $SimulatorStateCopyWith<$Res> {
  factory $SimulatorStateCopyWith(
          SimulatorState value, $Res Function(SimulatorState) then) =
      _$SimulatorStateCopyWithImpl<$Res, SimulatorState>;
}

/// @nodoc
class _$SimulatorStateCopyWithImpl<$Res, $Val extends SimulatorState>
    implements $SimulatorStateCopyWith<$Res> {
  _$SimulatorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SimulatorState
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
    extends _$SimulatorStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of SimulatorState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'SimulatorState.initial()';
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
    required TResult Function(PkSimulationResult result, DosingRegimen regimen,
            bool isHanaPk, PkSimulationResult? hanaPkResult)
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
    TResult? Function(PkSimulationResult result, DosingRegimen regimen,
            bool isHanaPk, PkSimulationResult? hanaPkResult)?
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
    TResult Function(PkSimulationResult result, DosingRegimen regimen,
            bool isHanaPk, PkSimulationResult? hanaPkResult)?
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

abstract class _Initial implements SimulatorState {
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
    extends _$SimulatorStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of SimulatorState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'SimulatorState.loading()';
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
    required TResult Function(PkSimulationResult result, DosingRegimen regimen,
            bool isHanaPk, PkSimulationResult? hanaPkResult)
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
    TResult? Function(PkSimulationResult result, DosingRegimen regimen,
            bool isHanaPk, PkSimulationResult? hanaPkResult)?
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
    TResult Function(PkSimulationResult result, DosingRegimen regimen,
            bool isHanaPk, PkSimulationResult? hanaPkResult)?
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

abstract class _Loading implements SimulatorState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {PkSimulationResult result,
      DosingRegimen regimen,
      bool isHanaPk,
      PkSimulationResult? hanaPkResult});

  $PkSimulationResultCopyWith<$Res> get result;
  $DosingRegimenCopyWith<$Res> get regimen;
  $PkSimulationResultCopyWith<$Res>? get hanaPkResult;
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$SimulatorStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SimulatorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? regimen = null,
    Object? isHanaPk = null,
    Object? hanaPkResult = freezed,
  }) {
    return _then(_$LoadedImpl(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as PkSimulationResult,
      regimen: null == regimen
          ? _value.regimen
          : regimen // ignore: cast_nullable_to_non_nullable
              as DosingRegimen,
      isHanaPk: null == isHanaPk
          ? _value.isHanaPk
          : isHanaPk // ignore: cast_nullable_to_non_nullable
              as bool,
      hanaPkResult: freezed == hanaPkResult
          ? _value.hanaPkResult
          : hanaPkResult // ignore: cast_nullable_to_non_nullable
              as PkSimulationResult?,
    ));
  }

  /// Create a copy of SimulatorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PkSimulationResultCopyWith<$Res> get result {
    return $PkSimulationResultCopyWith<$Res>(_value.result, (value) {
      return _then(_value.copyWith(result: value));
    });
  }

  /// Create a copy of SimulatorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DosingRegimenCopyWith<$Res> get regimen {
    return $DosingRegimenCopyWith<$Res>(_value.regimen, (value) {
      return _then(_value.copyWith(regimen: value));
    });
  }

  /// Create a copy of SimulatorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PkSimulationResultCopyWith<$Res>? get hanaPkResult {
    if (_value.hanaPkResult == null) {
      return null;
    }

    return $PkSimulationResultCopyWith<$Res>(_value.hanaPkResult!, (value) {
      return _then(_value.copyWith(hanaPkResult: value));
    });
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(
      {required this.result,
      required this.regimen,
      required this.isHanaPk,
      this.hanaPkResult});

  @override
  final PkSimulationResult result;
// Active engine result
  @override
  final DosingRegimen regimen;
  @override
  final bool isHanaPk;
// True if active result is Hana-PK
  @override
  final PkSimulationResult? hanaPkResult;

  @override
  String toString() {
    return 'SimulatorState.loaded(result: $result, regimen: $regimen, isHanaPk: $isHanaPk, hanaPkResult: $hanaPkResult)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.regimen, regimen) || other.regimen == regimen) &&
            (identical(other.isHanaPk, isHanaPk) ||
                other.isHanaPk == isHanaPk) &&
            (identical(other.hanaPkResult, hanaPkResult) ||
                other.hanaPkResult == hanaPkResult));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, result, regimen, isHanaPk, hanaPkResult);

  /// Create a copy of SimulatorState
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
    required TResult Function(PkSimulationResult result, DosingRegimen regimen,
            bool isHanaPk, PkSimulationResult? hanaPkResult)
        loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(result, regimen, isHanaPk, hanaPkResult);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(PkSimulationResult result, DosingRegimen regimen,
            bool isHanaPk, PkSimulationResult? hanaPkResult)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(result, regimen, isHanaPk, hanaPkResult);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(PkSimulationResult result, DosingRegimen regimen,
            bool isHanaPk, PkSimulationResult? hanaPkResult)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(result, regimen, isHanaPk, hanaPkResult);
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

abstract class _Loaded implements SimulatorState {
  const factory _Loaded(
      {required final PkSimulationResult result,
      required final DosingRegimen regimen,
      required final bool isHanaPk,
      final PkSimulationResult? hanaPkResult}) = _$LoadedImpl;

  PkSimulationResult get result; // Active engine result
  DosingRegimen get regimen;
  bool get isHanaPk; // True if active result is Hana-PK
  PkSimulationResult? get hanaPkResult;

  /// Create a copy of SimulatorState
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
    extends _$SimulatorStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of SimulatorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'SimulatorState.error(message: $message)';
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

  /// Create a copy of SimulatorState
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
    required TResult Function(PkSimulationResult result, DosingRegimen regimen,
            bool isHanaPk, PkSimulationResult? hanaPkResult)
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
    TResult? Function(PkSimulationResult result, DosingRegimen regimen,
            bool isHanaPk, PkSimulationResult? hanaPkResult)?
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
    TResult Function(PkSimulationResult result, DosingRegimen regimen,
            bool isHanaPk, PkSimulationResult? hanaPkResult)?
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

abstract class _Error implements SimulatorState {
  const factory _Error({required final String message}) = _$ErrorImpl;

  String get message;

  /// Create a copy of SimulatorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
