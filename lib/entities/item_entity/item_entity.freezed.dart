// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'item_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ItemEntity {
  String get name => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  int get tokenId => throw _privateConstructorUsedError;
  String get effect => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ItemEntityCopyWith<ItemEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemEntityCopyWith<$Res> {
  factory $ItemEntityCopyWith(
          ItemEntity value, $Res Function(ItemEntity) then) =
      _$ItemEntityCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String image,
      int id,
      int tokenId,
      String effect,
      int level});
}

/// @nodoc
class _$ItemEntityCopyWithImpl<$Res> implements $ItemEntityCopyWith<$Res> {
  _$ItemEntityCopyWithImpl(this._value, this._then);

  final ItemEntity _value;
  // ignore: unused_field
  final $Res Function(ItemEntity) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? image = freezed,
    Object? id = freezed,
    Object? tokenId = freezed,
    Object? effect = freezed,
    Object? level = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      tokenId: tokenId == freezed
          ? _value.tokenId
          : tokenId // ignore: cast_nullable_to_non_nullable
              as int,
      effect: effect == freezed
          ? _value.effect
          : effect // ignore: cast_nullable_to_non_nullable
              as String,
      level: level == freezed
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_ItemEntityCopyWith<$Res>
    implements $ItemEntityCopyWith<$Res> {
  factory _$$_ItemEntityCopyWith(
          _$_ItemEntity value, $Res Function(_$_ItemEntity) then) =
      __$$_ItemEntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String image,
      int id,
      int tokenId,
      String effect,
      int level});
}

/// @nodoc
class __$$_ItemEntityCopyWithImpl<$Res> extends _$ItemEntityCopyWithImpl<$Res>
    implements _$$_ItemEntityCopyWith<$Res> {
  __$$_ItemEntityCopyWithImpl(
      _$_ItemEntity _value, $Res Function(_$_ItemEntity) _then)
      : super(_value, (v) => _then(v as _$_ItemEntity));

  @override
  _$_ItemEntity get _value => super._value as _$_ItemEntity;

  @override
  $Res call({
    Object? name = freezed,
    Object? image = freezed,
    Object? id = freezed,
    Object? tokenId = freezed,
    Object? effect = freezed,
    Object? level = freezed,
  }) {
    return _then(_$_ItemEntity(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      tokenId: tokenId == freezed
          ? _value.tokenId
          : tokenId // ignore: cast_nullable_to_non_nullable
              as int,
      effect: effect == freezed
          ? _value.effect
          : effect // ignore: cast_nullable_to_non_nullable
              as String,
      level: level == freezed
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ItemEntity implements _ItemEntity {
  const _$_ItemEntity(
      {required this.name,
      required this.image,
      required this.id,
      required this.tokenId,
      required this.effect,
      required this.level});

  @override
  final String name;
  @override
  final String image;
  @override
  final int id;
  @override
  final int tokenId;
  @override
  final String effect;
  @override
  final int level;

  @override
  String toString() {
    return 'ItemEntity(name: $name, image: $image, id: $id, tokenId: $tokenId, effect: $effect, level: $level)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ItemEntity &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.tokenId, tokenId) &&
            const DeepCollectionEquality().equals(other.effect, effect) &&
            const DeepCollectionEquality().equals(other.level, level));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(tokenId),
      const DeepCollectionEquality().hash(effect),
      const DeepCollectionEquality().hash(level));

  @JsonKey(ignore: true)
  @override
  _$$_ItemEntityCopyWith<_$_ItemEntity> get copyWith =>
      __$$_ItemEntityCopyWithImpl<_$_ItemEntity>(this, _$identity);
}

abstract class _ItemEntity implements ItemEntity {
  const factory _ItemEntity(
      {required final String name,
      required final String image,
      required final int id,
      required final int tokenId,
      required final String effect,
      required final int level}) = _$_ItemEntity;

  @override
  String get name;
  @override
  String get image;
  @override
  int get id;
  @override
  int get tokenId;
  @override
  String get effect;
  @override
  int get level;
  @override
  @JsonKey(ignore: true)
  _$$_ItemEntityCopyWith<_$_ItemEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
