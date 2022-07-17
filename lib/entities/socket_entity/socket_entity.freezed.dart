// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'socket_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SocketEntity {
  SocketType get socketType => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  JewelEntity? get jewelEntity => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SocketEntityCopyWith<SocketEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocketEntityCopyWith<$Res> {
  factory $SocketEntityCopyWith(
          SocketEntity value, $Res Function(SocketEntity) then) =
      _$SocketEntityCopyWithImpl<$Res>;
  $Res call(
      {SocketType socketType, int id, String image, JewelEntity? jewelEntity});
}

/// @nodoc
class _$SocketEntityCopyWithImpl<$Res> implements $SocketEntityCopyWith<$Res> {
  _$SocketEntityCopyWithImpl(this._value, this._then);

  final SocketEntity _value;
  // ignore: unused_field
  final $Res Function(SocketEntity) _then;

  @override
  $Res call({
    Object? socketType = freezed,
    Object? id = freezed,
    Object? image = freezed,
    Object? jewelEntity = freezed,
  }) {
    return _then(_value.copyWith(
      socketType: socketType == freezed
          ? _value.socketType
          : socketType // ignore: cast_nullable_to_non_nullable
              as SocketType,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      jewelEntity: jewelEntity == freezed
          ? _value.jewelEntity
          : jewelEntity // ignore: cast_nullable_to_non_nullable
              as JewelEntity?,
    ));
  }
}

/// @nodoc
abstract class _$$_SocketEntityCopyWith<$Res>
    implements $SocketEntityCopyWith<$Res> {
  factory _$$_SocketEntityCopyWith(
          _$_SocketEntity value, $Res Function(_$_SocketEntity) then) =
      __$$_SocketEntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {SocketType socketType, int id, String image, JewelEntity? jewelEntity});
}

/// @nodoc
class __$$_SocketEntityCopyWithImpl<$Res>
    extends _$SocketEntityCopyWithImpl<$Res>
    implements _$$_SocketEntityCopyWith<$Res> {
  __$$_SocketEntityCopyWithImpl(
      _$_SocketEntity _value, $Res Function(_$_SocketEntity) _then)
      : super(_value, (v) => _then(v as _$_SocketEntity));

  @override
  _$_SocketEntity get _value => super._value as _$_SocketEntity;

  @override
  $Res call({
    Object? socketType = freezed,
    Object? id = freezed,
    Object? image = freezed,
    Object? jewelEntity = freezed,
  }) {
    return _then(_$_SocketEntity(
      socketType: socketType == freezed
          ? _value.socketType
          : socketType // ignore: cast_nullable_to_non_nullable
              as SocketType,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      jewelEntity: jewelEntity == freezed
          ? _value.jewelEntity
          : jewelEntity // ignore: cast_nullable_to_non_nullable
              as JewelEntity?,
    ));
  }
}

/// @nodoc

class _$_SocketEntity implements _SocketEntity {
  const _$_SocketEntity(
      {required this.socketType,
      required this.id,
      required this.image,
      this.jewelEntity});

  @override
  final SocketType socketType;
  @override
  final int id;
  @override
  final String image;
  @override
  final JewelEntity? jewelEntity;

  @override
  String toString() {
    return 'SocketEntity(socketType: $socketType, id: $id, image: $image, jewelEntity: $jewelEntity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SocketEntity &&
            const DeepCollectionEquality()
                .equals(other.socketType, socketType) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality()
                .equals(other.jewelEntity, jewelEntity));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(socketType),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(jewelEntity));

  @JsonKey(ignore: true)
  @override
  _$$_SocketEntityCopyWith<_$_SocketEntity> get copyWith =>
      __$$_SocketEntityCopyWithImpl<_$_SocketEntity>(this, _$identity);
}

abstract class _SocketEntity implements SocketEntity {
  const factory _SocketEntity(
      {required final SocketType socketType,
      required final int id,
      required final String image,
      final JewelEntity? jewelEntity}) = _$_SocketEntity;

  @override
  SocketType get socketType;
  @override
  int get id;
  @override
  String get image;
  @override
  JewelEntity? get jewelEntity;
  @override
  @JsonKey(ignore: true)
  _$$_SocketEntityCopyWith<_$_SocketEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
