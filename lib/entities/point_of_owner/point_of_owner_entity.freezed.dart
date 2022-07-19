// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'point_of_owner_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PointOfOwnerEntity {
  double get point => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PointOfOwnerEntityCopyWith<PointOfOwnerEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointOfOwnerEntityCopyWith<$Res> {
  factory $PointOfOwnerEntityCopyWith(
          PointOfOwnerEntity value, $Res Function(PointOfOwnerEntity) then) =
      _$PointOfOwnerEntityCopyWithImpl<$Res>;
  $Res call({double point});
}

/// @nodoc
class _$PointOfOwnerEntityCopyWithImpl<$Res>
    implements $PointOfOwnerEntityCopyWith<$Res> {
  _$PointOfOwnerEntityCopyWithImpl(this._value, this._then);

  final PointOfOwnerEntity _value;
  // ignore: unused_field
  final $Res Function(PointOfOwnerEntity) _then;

  @override
  $Res call({
    Object? point = freezed,
  }) {
    return _then(_value.copyWith(
      point: point == freezed
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$$_PointOfOwnerEntityCopyWith<$Res>
    implements $PointOfOwnerEntityCopyWith<$Res> {
  factory _$$_PointOfOwnerEntityCopyWith(_$_PointOfOwnerEntity value,
          $Res Function(_$_PointOfOwnerEntity) then) =
      __$$_PointOfOwnerEntityCopyWithImpl<$Res>;
  @override
  $Res call({double point});
}

/// @nodoc
class __$$_PointOfOwnerEntityCopyWithImpl<$Res>
    extends _$PointOfOwnerEntityCopyWithImpl<$Res>
    implements _$$_PointOfOwnerEntityCopyWith<$Res> {
  __$$_PointOfOwnerEntityCopyWithImpl(
      _$_PointOfOwnerEntity _value, $Res Function(_$_PointOfOwnerEntity) _then)
      : super(_value, (v) => _then(v as _$_PointOfOwnerEntity));

  @override
  _$_PointOfOwnerEntity get _value => super._value as _$_PointOfOwnerEntity;

  @override
  $Res call({
    Object? point = freezed,
  }) {
    return _then(_$_PointOfOwnerEntity(
      point: point == freezed
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_PointOfOwnerEntity
    with DiagnosticableTreeMixin
    implements _PointOfOwnerEntity {
  const _$_PointOfOwnerEntity({required this.point});

  @override
  final double point;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PointOfOwnerEntity(point: $point)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PointOfOwnerEntity'))
      ..add(DiagnosticsProperty('point', point));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PointOfOwnerEntity &&
            const DeepCollectionEquality().equals(other.point, point));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(point));

  @JsonKey(ignore: true)
  @override
  _$$_PointOfOwnerEntityCopyWith<_$_PointOfOwnerEntity> get copyWith =>
      __$$_PointOfOwnerEntityCopyWithImpl<_$_PointOfOwnerEntity>(
          this, _$identity);
}

abstract class _PointOfOwnerEntity implements PointOfOwnerEntity {
  const factory _PointOfOwnerEntity({required final double point}) =
      _$_PointOfOwnerEntity;

  @override
  double get point;
  @override
  @JsonKey(ignore: true)
  _$$_PointOfOwnerEntityCopyWith<_$_PointOfOwnerEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
