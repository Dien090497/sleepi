// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'staking_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StakingEntity {
  StackCampaignsEntity get stackCampaignsEntity =>
      throw _privateConstructorUsedError;
  StackDetailsEntity get stackDetailsEntity =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StakingEntityCopyWith<StakingEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StakingEntityCopyWith<$Res> {
  factory $StakingEntityCopyWith(
          StakingEntity value, $Res Function(StakingEntity) then) =
      _$StakingEntityCopyWithImpl<$Res>;
  $Res call(
      {StackCampaignsEntity stackCampaignsEntity,
      StackDetailsEntity stackDetailsEntity});

  $StackCampaignsEntityCopyWith<$Res> get stackCampaignsEntity;
  $StackDetailsEntityCopyWith<$Res> get stackDetailsEntity;
}

/// @nodoc
class _$StakingEntityCopyWithImpl<$Res>
    implements $StakingEntityCopyWith<$Res> {
  _$StakingEntityCopyWithImpl(this._value, this._then);

  final StakingEntity _value;
  // ignore: unused_field
  final $Res Function(StakingEntity) _then;

  @override
  $Res call({
    Object? stackCampaignsEntity = freezed,
    Object? stackDetailsEntity = freezed,
  }) {
    return _then(_value.copyWith(
      stackCampaignsEntity: stackCampaignsEntity == freezed
          ? _value.stackCampaignsEntity
          : stackCampaignsEntity // ignore: cast_nullable_to_non_nullable
              as StackCampaignsEntity,
      stackDetailsEntity: stackDetailsEntity == freezed
          ? _value.stackDetailsEntity
          : stackDetailsEntity // ignore: cast_nullable_to_non_nullable
              as StackDetailsEntity,
    ));
  }

  @override
  $StackCampaignsEntityCopyWith<$Res> get stackCampaignsEntity {
    return $StackCampaignsEntityCopyWith<$Res>(_value.stackCampaignsEntity,
        (value) {
      return _then(_value.copyWith(stackCampaignsEntity: value));
    });
  }

  @override
  $StackDetailsEntityCopyWith<$Res> get stackDetailsEntity {
    return $StackDetailsEntityCopyWith<$Res>(_value.stackDetailsEntity,
        (value) {
      return _then(_value.copyWith(stackDetailsEntity: value));
    });
  }
}

/// @nodoc
abstract class _$$_StakingEntityCopyWith<$Res>
    implements $StakingEntityCopyWith<$Res> {
  factory _$$_StakingEntityCopyWith(
          _$_StakingEntity value, $Res Function(_$_StakingEntity) then) =
      __$$_StakingEntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {StackCampaignsEntity stackCampaignsEntity,
      StackDetailsEntity stackDetailsEntity});

  @override
  $StackCampaignsEntityCopyWith<$Res> get stackCampaignsEntity;
  @override
  $StackDetailsEntityCopyWith<$Res> get stackDetailsEntity;
}

/// @nodoc
class __$$_StakingEntityCopyWithImpl<$Res>
    extends _$StakingEntityCopyWithImpl<$Res>
    implements _$$_StakingEntityCopyWith<$Res> {
  __$$_StakingEntityCopyWithImpl(
      _$_StakingEntity _value, $Res Function(_$_StakingEntity) _then)
      : super(_value, (v) => _then(v as _$_StakingEntity));

  @override
  _$_StakingEntity get _value => super._value as _$_StakingEntity;

  @override
  $Res call({
    Object? stackCampaignsEntity = freezed,
    Object? stackDetailsEntity = freezed,
  }) {
    return _then(_$_StakingEntity(
      stackCampaignsEntity: stackCampaignsEntity == freezed
          ? _value.stackCampaignsEntity
          : stackCampaignsEntity // ignore: cast_nullable_to_non_nullable
              as StackCampaignsEntity,
      stackDetailsEntity: stackDetailsEntity == freezed
          ? _value.stackDetailsEntity
          : stackDetailsEntity // ignore: cast_nullable_to_non_nullable
              as StackDetailsEntity,
    ));
  }
}

/// @nodoc

class _$_StakingEntity implements _StakingEntity {
  const _$_StakingEntity(
      {required this.stackCampaignsEntity, required this.stackDetailsEntity});

  @override
  final StackCampaignsEntity stackCampaignsEntity;
  @override
  final StackDetailsEntity stackDetailsEntity;

  @override
  String toString() {
    return 'StakingEntity(stackCampaignsEntity: $stackCampaignsEntity, stackDetailsEntity: $stackDetailsEntity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StakingEntity &&
            const DeepCollectionEquality()
                .equals(other.stackCampaignsEntity, stackCampaignsEntity) &&
            const DeepCollectionEquality()
                .equals(other.stackDetailsEntity, stackDetailsEntity));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(stackCampaignsEntity),
      const DeepCollectionEquality().hash(stackDetailsEntity));

  @JsonKey(ignore: true)
  @override
  _$$_StakingEntityCopyWith<_$_StakingEntity> get copyWith =>
      __$$_StakingEntityCopyWithImpl<_$_StakingEntity>(this, _$identity);
}

abstract class _StakingEntity implements StakingEntity {
  const factory _StakingEntity(
      {required final StackCampaignsEntity stackCampaignsEntity,
      required final StackDetailsEntity stackDetailsEntity}) = _$_StakingEntity;

  @override
  StackCampaignsEntity get stackCampaignsEntity;
  @override
  StackDetailsEntity get stackDetailsEntity;
  @override
  @JsonKey(ignore: true)
  _$$_StakingEntityCopyWith<_$_StakingEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
