// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pk_parameters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PkParameters {
  double get k1 => throw _privateConstructorUsedError;
  double get k2 => throw _privateConstructorUsedError;
  double get k3 => throw _privateConstructorUsedError;

  /// Create a copy of PkParameters
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PkParametersCopyWith<PkParameters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PkParametersCopyWith<$Res> {
  factory $PkParametersCopyWith(
          PkParameters value, $Res Function(PkParameters) then) =
      _$PkParametersCopyWithImpl<$Res, PkParameters>;
  @useResult
  $Res call({double k1, double k2, double k3});
}

/// @nodoc
class _$PkParametersCopyWithImpl<$Res, $Val extends PkParameters>
    implements $PkParametersCopyWith<$Res> {
  _$PkParametersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PkParameters
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? k1 = null,
    Object? k2 = null,
    Object? k3 = null,
  }) {
    return _then(_value.copyWith(
      k1: null == k1
          ? _value.k1
          : k1 // ignore: cast_nullable_to_non_nullable
              as double,
      k2: null == k2
          ? _value.k2
          : k2 // ignore: cast_nullable_to_non_nullable
              as double,
      k3: null == k3
          ? _value.k3
          : k3 // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PkParametersImplCopyWith<$Res>
    implements $PkParametersCopyWith<$Res> {
  factory _$$PkParametersImplCopyWith(
          _$PkParametersImpl value, $Res Function(_$PkParametersImpl) then) =
      __$$PkParametersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double k1, double k2, double k3});
}

/// @nodoc
class __$$PkParametersImplCopyWithImpl<$Res>
    extends _$PkParametersCopyWithImpl<$Res, _$PkParametersImpl>
    implements _$$PkParametersImplCopyWith<$Res> {
  __$$PkParametersImplCopyWithImpl(
      _$PkParametersImpl _value, $Res Function(_$PkParametersImpl) _then)
      : super(_value, _then);

  /// Create a copy of PkParameters
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? k1 = null,
    Object? k2 = null,
    Object? k3 = null,
  }) {
    return _then(_$PkParametersImpl(
      k1: null == k1
          ? _value.k1
          : k1 // ignore: cast_nullable_to_non_nullable
              as double,
      k2: null == k2
          ? _value.k2
          : k2 // ignore: cast_nullable_to_non_nullable
              as double,
      k3: null == k3
          ? _value.k3
          : k3 // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$PkParametersImpl implements _PkParameters {
  const _$PkParametersImpl(
      {required this.k1, required this.k2, required this.k3})
      : assert(k1 > 0, 'k1 must be positive'),
        assert(k2 > 0, 'k2 must be positive'),
        assert(k3 > 0, 'k3 must be positive');

  @override
  final double k1;
  @override
  final double k2;
  @override
  final double k3;

  @override
  String toString() {
    return 'PkParameters(k1: $k1, k2: $k2, k3: $k3)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PkParametersImpl &&
            (identical(other.k1, k1) || other.k1 == k1) &&
            (identical(other.k2, k2) || other.k2 == k2) &&
            (identical(other.k3, k3) || other.k3 == k3));
  }

  @override
  int get hashCode => Object.hash(runtimeType, k1, k2, k3);

  /// Create a copy of PkParameters
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PkParametersImplCopyWith<_$PkParametersImpl> get copyWith =>
      __$$PkParametersImplCopyWithImpl<_$PkParametersImpl>(this, _$identity);
}

abstract class _PkParameters implements PkParameters {
  const factory _PkParameters(
      {required final double k1,
      required final double k2,
      required final double k3}) = _$PkParametersImpl;

  @override
  double get k1;
  @override
  double get k2;
  @override
  double get k3;

  /// Create a copy of PkParameters
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PkParametersImplCopyWith<_$PkParametersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
