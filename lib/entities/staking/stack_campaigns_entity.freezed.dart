// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'stack_campaigns_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StackCampaignsEntity {
  String get stakeToken => throw _privateConstructorUsedError;
  String get rewardToken => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StackCampaignsEntityCopyWith<StackCampaignsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StackCampaignsEntityCopyWith<$Res> {
  factory $StackCampaignsEntityCopyWith(StackCampaignsEntity value,
          $Res Function(StackCampaignsEntity) then) =
      _$StackCampaignsEntityCopyWithImpl<$Res>;
  $Res call(
      {String stakeToken,
      String rewardToken,
      String createdAt,
      String updatedAt,
      int id});
}

/// @nodoc
class _$StackCampaignsEntityCopyWithImpl<$Res>
    implements $StackCampaignsEntityCopyWith<$Res> {
  _$StackCampaignsEntityCopyWithImpl(this._value, this._then);

  final StackCampaignsEntity _value;
  // ignore: unused_field
  final $Res Function(StackCampaignsEntity) _then;

  @override
  $Res call({
    Object? stakeToken = freezed,
    Object? rewardToken = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      stakeToken: stakeToken == freezed
          ? _value.stakeToken
          : stakeToken // ignore: cast_nullable_to_non_nullable
              as String,
      rewardToken: rewardToken == freezed
          ? _value.rewardToken
          : rewardToken // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_StackCampaignsEntityCopyWith<$Res>
    implements $StackCampaignsEntityCopyWith<$Res> {
  factory _$$_StackCampaignsEntityCopyWith(_$_StackCampaignsEntity value,
          $Res Function(_$_StackCampaignsEntity) then) =
      __$$_StackCampaignsEntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {String stakeToken,
      String rewardToken,
      String createdAt,
      String updatedAt,
      int id});
}

/// @nodoc
class __$$_StackCampaignsEntityCopyWithImpl<$Res>
    extends _$StackCampaignsEntityCopyWithImpl<$Res>
    implements _$$_StackCampaignsEntityCopyWith<$Res> {
  __$$_StackCampaignsEntityCopyWithImpl(_$_StackCampaignsEntity _value,
      $Res Function(_$_StackCampaignsEntity) _then)
      : super(_value, (v) => _then(v as _$_StackCampaignsEntity));

  @override
  _$_StackCampaignsEntity get _value => super._value as _$_StackCampaignsEntity;

  @override
  $Res call({
    Object? stakeToken = freezed,
    Object? rewardToken = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? id = freezed,
  }) {
    return _then(_$_StackCampaignsEntity(
      stakeToken: stakeToken == freezed
          ? _value.stakeToken
          : stakeToken // ignore: cast_nullable_to_non_nullable
              as String,
      rewardToken: rewardToken == freezed
          ? _value.rewardToken
          : rewardToken // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_StackCampaignsEntity implements _StackCampaignsEntity {
  const _$_StackCampaignsEntity(
      {required this.stakeToken,
      required this.rewardToken,
      required this.createdAt,
      required this.updatedAt,
      required this.id});

  @override
  final String stakeToken;
  @override
  final String rewardToken;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final int id;

  @override
  String toString() {
    return 'StackCampaignsEntity(stakeToken: $stakeToken, rewardToken: $rewardToken, createdAt: $createdAt, updatedAt: $updatedAt, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StackCampaignsEntity &&
            const DeepCollectionEquality()
                .equals(other.stakeToken, stakeToken) &&
            const DeepCollectionEquality()
                .equals(other.rewardToken, rewardToken) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(stakeToken),
      const DeepCollectionEquality().hash(rewardToken),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  _$$_StackCampaignsEntityCopyWith<_$_StackCampaignsEntity> get copyWith =>
      __$$_StackCampaignsEntityCopyWithImpl<_$_StackCampaignsEntity>(
          this, _$identity);
}

abstract class _StackCampaignsEntity implements StackCampaignsEntity {
  const factory _StackCampaignsEntity(
      {required final String stakeToken,
      required final String rewardToken,
      required final String createdAt,
      required final String updatedAt,
      required final int id}) = _$_StackCampaignsEntity;

  @override
  String get stakeToken;
  @override
  String get rewardToken;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$_StackCampaignsEntityCopyWith<_$_StackCampaignsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
