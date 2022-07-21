// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'nft_sell_response_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NftSellResponseEntity {
  String? get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NftSellResponseEntityCopyWith<NftSellResponseEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NftSellResponseEntityCopyWith<$Res> {
  factory $NftSellResponseEntityCopyWith(NftSellResponseEntity value,
          $Res Function(NftSellResponseEntity) then) =
      _$NftSellResponseEntityCopyWithImpl<$Res>;
  $Res call({String? message});
}

/// @nodoc
class _$NftSellResponseEntityCopyWithImpl<$Res>
    implements $NftSellResponseEntityCopyWith<$Res> {
  _$NftSellResponseEntityCopyWithImpl(this._value, this._then);

  final NftSellResponseEntity _value;
  // ignore: unused_field
  final $Res Function(NftSellResponseEntity) _then;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_NftSellResponseEntityCopyWith<$Res>
    implements $NftSellResponseEntityCopyWith<$Res> {
  factory _$$_NftSellResponseEntityCopyWith(_$_NftSellResponseEntity value,
          $Res Function(_$_NftSellResponseEntity) then) =
      __$$_NftSellResponseEntityCopyWithImpl<$Res>;
  @override
  $Res call({String? message});
}

/// @nodoc
class __$$_NftSellResponseEntityCopyWithImpl<$Res>
    extends _$NftSellResponseEntityCopyWithImpl<$Res>
    implements _$$_NftSellResponseEntityCopyWith<$Res> {
  __$$_NftSellResponseEntityCopyWithImpl(_$_NftSellResponseEntity _value,
      $Res Function(_$_NftSellResponseEntity) _then)
      : super(_value, (v) => _then(v as _$_NftSellResponseEntity));

  @override
  _$_NftSellResponseEntity get _value =>
      super._value as _$_NftSellResponseEntity;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$_NftSellResponseEntity(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_NftSellResponseEntity implements _NftSellResponseEntity {
  const _$_NftSellResponseEntity({required this.message});

  @override
  final String? message;

  @override
  String toString() {
    return 'NftSellResponseEntity(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NftSellResponseEntity &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$_NftSellResponseEntityCopyWith<_$_NftSellResponseEntity> get copyWith =>
      __$$_NftSellResponseEntityCopyWithImpl<_$_NftSellResponseEntity>(
          this, _$identity);
}

abstract class _NftSellResponseEntity implements NftSellResponseEntity {
  const factory _NftSellResponseEntity({required final String? message}) =
      _$_NftSellResponseEntity;

  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_NftSellResponseEntityCopyWith<_$_NftSellResponseEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
