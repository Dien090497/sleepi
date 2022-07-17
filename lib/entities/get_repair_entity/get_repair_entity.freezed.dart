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
  String? get durability => throw _privateConstructorUsedError;
  String? get cost => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetRepairtEntityCopyWith<GetRepairtEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetRepairtEntityCopyWith<$Res> {
  factory $GetRepairtEntityCopyWith(
          GetRepairtEntity value, $Res Function(GetRepairtEntity) then) =
      _$GetRepairtEntityCopyWithImpl<$Res>;
  $Res call({String? durability, String? cost});
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
    Object? durability = freezed,
    Object? cost = freezed,
  }) {
    return _then(_value.copyWith(
      durability: durability == freezed
          ? _value.durability
          : durability // ignore: cast_nullable_to_non_nullable
              as String?,
      cost: cost == freezed
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as String?,
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
  $Res call({String? durability, String? cost});
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
    Object? durability = freezed,
    Object? cost = freezed,
  }) {
    return _then(_$_GetRepairtEntity(
      durability: durability == freezed
          ? _value.durability
          : durability // ignore: cast_nullable_to_non_nullable
              as String?,
      cost: cost == freezed
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_GetRepairtEntity
    with DiagnosticableTreeMixin
    implements _GetRepairtEntity {
  const _$_GetRepairtEntity({required this.durability, required this.cost});

  @override
  final String? durability;
  @override
  final String? cost;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GetRepairtEntity(durability: $durability, cost: $cost)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GetRepairtEntity'))
      ..add(DiagnosticsProperty('durability', durability))
      ..add(DiagnosticsProperty('cost', cost));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetRepairtEntity &&
            const DeepCollectionEquality()
                .equals(other.durability, durability) &&
            const DeepCollectionEquality().equals(other.cost, cost));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(durability),
      const DeepCollectionEquality().hash(cost));

  @JsonKey(ignore: true)
  @override
  _$$_GetRepairtEntityCopyWith<_$_GetRepairtEntity> get copyWith =>
      __$$_GetRepairtEntityCopyWithImpl<_$_GetRepairtEntity>(this, _$identity);
}

abstract class _GetRepairtEntity implements GetRepairtEntity {
  const factory _GetRepairtEntity(
      {required final String? durability,
      required final String? cost}) = _$_GetRepairtEntity;

  @override
  String? get durability;
  @override
  String? get cost;
  @override
  @JsonKey(ignore: true)
  _$$_GetRepairtEntityCopyWith<_$_GetRepairtEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
