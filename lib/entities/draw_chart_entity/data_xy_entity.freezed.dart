// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'data_xy_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DataXYEntity {
  String get x => throw _privateConstructorUsedError;
  double get y => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DataXYEntityCopyWith<DataXYEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataXYEntityCopyWith<$Res> {
  factory $DataXYEntityCopyWith(
          DataXYEntity value, $Res Function(DataXYEntity) then) =
      _$DataXYEntityCopyWithImpl<$Res>;
  $Res call({String x, double y});
}

/// @nodoc
class _$DataXYEntityCopyWithImpl<$Res> implements $DataXYEntityCopyWith<$Res> {
  _$DataXYEntityCopyWithImpl(this._value, this._then);

  final DataXYEntity _value;
  // ignore: unused_field
  final $Res Function(DataXYEntity) _then;

  @override
  $Res call({
    Object? x = freezed,
    Object? y = freezed,
  }) {
    return _then(_value.copyWith(
      x: x == freezed
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as String,
      y: y == freezed
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$$_DataXYEntityCopyWith<$Res>
    implements $DataXYEntityCopyWith<$Res> {
  factory _$$_DataXYEntityCopyWith(
          _$_DataXYEntity value, $Res Function(_$_DataXYEntity) then) =
      __$$_DataXYEntityCopyWithImpl<$Res>;
  @override
  $Res call({String x, double y});
}

/// @nodoc
class __$$_DataXYEntityCopyWithImpl<$Res>
    extends _$DataXYEntityCopyWithImpl<$Res>
    implements _$$_DataXYEntityCopyWith<$Res> {
  __$$_DataXYEntityCopyWithImpl(
      _$_DataXYEntity _value, $Res Function(_$_DataXYEntity) _then)
      : super(_value, (v) => _then(v as _$_DataXYEntity));

  @override
  _$_DataXYEntity get _value => super._value as _$_DataXYEntity;

  @override
  $Res call({
    Object? x = freezed,
    Object? y = freezed,
  }) {
    return _then(_$_DataXYEntity(
      x: x == freezed
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as String,
      y: y == freezed
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_DataXYEntity implements _DataXYEntity {
  const _$_DataXYEntity({required this.x, required this.y});

  @override
  final String x;
  @override
  final double y;

  @override
  String toString() {
    return 'DataXYEntity(x: $x, y: $y)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DataXYEntity &&
            const DeepCollectionEquality().equals(other.x, x) &&
            const DeepCollectionEquality().equals(other.y, y));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(x),
      const DeepCollectionEquality().hash(y));

  @JsonKey(ignore: true)
  @override
  _$$_DataXYEntityCopyWith<_$_DataXYEntity> get copyWith =>
      __$$_DataXYEntityCopyWithImpl<_$_DataXYEntity>(this, _$identity);
}

abstract class _DataXYEntity implements DataXYEntity {
  const factory _DataXYEntity(
      {required final String x, required final double y}) = _$_DataXYEntity;

  @override
  String get x;
  @override
  double get y;
  @override
  @JsonKey(ignore: true)
  _$$_DataXYEntityCopyWith<_$_DataXYEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
