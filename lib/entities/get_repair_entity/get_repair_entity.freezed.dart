// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'get_repair_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GetRepairtEntity {
  String? get level => throw _privateConstructorUsedError;
  double? get fee => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetRepairtEntityCopyWith<GetRepairtEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetRepairtEntityCopyWith<$Res> {
  factory $GetRepairtEntityCopyWith(
          GetRepairtEntity value, $Res Function(GetRepairtEntity) then) =
      _$GetRepairtEntityCopyWithImpl<$Res>;
  $Res call({String? level, double? fee});
}

/// @nodoc
class _$GetRepairtEntityCopyWithImpl<$Res>
    implements $GetRepairtEntityCopyWith<$Res> {
  _$GetRepairtEntityCopyWithImpl(this._value, this._then);

  final GetRepairtEntity _value;
  // ignore: unused_field
  final $Res Function(GetRepairtEntity) _then;

  @override
  $Res call({
    Object? level = freezed,
    Object? fee = freezed,
  }) {
    return _then(_value.copyWith(
      level: level == freezed
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String?,
      fee: fee == freezed
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
abstract class _$$_GetRepairtEntityCopyWith<$Res>
    implements $GetRepairtEntityCopyWith<$Res> {
  factory _$$_GetRepairtEntityCopyWith(
          _$_GetRepairtEntity value, $Res Function(_$_GetRepairtEntity) then) =
      __$$_GetRepairtEntityCopyWithImpl<$Res>;
  @override
  $Res call({String? level, double? fee});
}

/// @nodoc
class __$$_GetRepairtEntityCopyWithImpl<$Res>
    extends _$GetRepairtEntityCopyWithImpl<$Res>
    implements _$$_GetRepairtEntityCopyWith<$Res> {
  __$$_GetRepairtEntityCopyWithImpl(
      _$_GetRepairtEntity _value, $Res Function(_$_GetRepairtEntity) _then)
      : super(_value, (v) => _then(v as _$_GetRepairtEntity));

  @override
  _$_GetRepairtEntity get _value => super._value as _$_GetRepairtEntity;

  @override
  $Res call({
    Object? level = freezed,
    Object? fee = freezed,
  }) {
    return _then(_$_GetRepairtEntity(
      level: level == freezed
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String?,
      fee: fee == freezed
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$_GetRepairtEntity
    with DiagnosticableTreeMixin
    implements _GetRepairtEntity {
  const _$_GetRepairtEntity({required this.level, required this.fee});

  @override
  final String? level;
  @override
  final double? fee;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GetRepairtEntity(level: $level, fee: $fee)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GetRepairtEntity'))
      ..add(DiagnosticsProperty('level', level))
      ..add(DiagnosticsProperty('fee', fee));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetRepairtEntity &&
            const DeepCollectionEquality().equals(other.level, level) &&
            const DeepCollectionEquality().equals(other.fee, fee));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(level),
      const DeepCollectionEquality().hash(fee));

  @JsonKey(ignore: true)
  @override
  _$$_GetRepairtEntityCopyWith<_$_GetRepairtEntity> get copyWith =>
      __$$_GetRepairtEntityCopyWithImpl<_$_GetRepairtEntity>(this, _$identity);
}

abstract class _GetRepairtEntity implements GetRepairtEntity {
  const factory _GetRepairtEntity(
      {required final String? level,
      required final double? fee}) = _$_GetRepairtEntity;

  @override
  String? get level;
  @override
  double? get fee;
  @override
  @JsonKey(ignore: true)
  _$$_GetRepairtEntityCopyWith<_$_GetRepairtEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
