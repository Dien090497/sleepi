// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'individual_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$IndividualState {
  BedEntity get bed => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IndividualStateCopyWith<IndividualState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IndividualStateCopyWith<$Res> {
  factory $IndividualStateCopyWith(
          IndividualState value, $Res Function(IndividualState) then) =
      _$IndividualStateCopyWithImpl<$Res>;
  $Res call({BedEntity bed});

  $BedEntityCopyWith<$Res> get bed;
}

/// @nodoc
class _$IndividualStateCopyWithImpl<$Res>
    implements $IndividualStateCopyWith<$Res> {
  _$IndividualStateCopyWithImpl(this._value, this._then);

  final IndividualState _value;
  // ignore: unused_field
  final $Res Function(IndividualState) _then;

  @override
  $Res call({
    Object? bed = freezed,
  }) {
    return _then(_value.copyWith(
      bed: bed == freezed
          ? _value.bed
          : bed // ignore: cast_nullable_to_non_nullable
              as BedEntity,
    ));
  }

  @override
  $BedEntityCopyWith<$Res> get bed {
    return $BedEntityCopyWith<$Res>(_value.bed, (value) {
      return _then(_value.copyWith(bed: value));
    });
  }
}

/// @nodoc
abstract class _$$_IndividualStateCopyWith<$Res>
    implements $IndividualStateCopyWith<$Res> {
  factory _$$_IndividualStateCopyWith(
          _$_IndividualState value, $Res Function(_$_IndividualState) then) =
      __$$_IndividualStateCopyWithImpl<$Res>;
  @override
  $Res call({BedEntity bed});

  @override
  $BedEntityCopyWith<$Res> get bed;
}

/// @nodoc
class __$$_IndividualStateCopyWithImpl<$Res>
    extends _$IndividualStateCopyWithImpl<$Res>
    implements _$$_IndividualStateCopyWith<$Res> {
  __$$_IndividualStateCopyWithImpl(
      _$_IndividualState _value, $Res Function(_$_IndividualState) _then)
      : super(_value, (v) => _then(v as _$_IndividualState));

  @override
  _$_IndividualState get _value => super._value as _$_IndividualState;

  @override
  $Res call({
    Object? bed = freezed,
  }) {
    return _then(_$_IndividualState(
      bed == freezed
          ? _value.bed
          : bed // ignore: cast_nullable_to_non_nullable
              as BedEntity,
    ));
  }
}

/// @nodoc

class _$_IndividualState
    with DiagnosticableTreeMixin
    implements _IndividualState {
  const _$_IndividualState(this.bed);

  @override
  final BedEntity bed;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IndividualState(bed: $bed)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'IndividualState'))
      ..add(DiagnosticsProperty('bed', bed));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IndividualState &&
            const DeepCollectionEquality().equals(other.bed, bed));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(bed));

  @JsonKey(ignore: true)
  @override
  _$$_IndividualStateCopyWith<_$_IndividualState> get copyWith =>
      __$$_IndividualStateCopyWithImpl<_$_IndividualState>(this, _$identity);
}

abstract class _IndividualState implements IndividualState {
  const factory _IndividualState(final BedEntity bed) = _$_IndividualState;

  @override
  BedEntity get bed;
  @override
  @JsonKey(ignore: true)
  _$$_IndividualStateCopyWith<_$_IndividualState> get copyWith =>
      throw _privateConstructorUsedError;
}
