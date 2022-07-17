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
  int? get nftId => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  String? get price => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get symbol => throw _privateConstructorUsedError;
  String? get transactionsFee => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NftSellResponseEntityCopyWith<NftSellResponseEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NftSellResponseEntityCopyWith<$Res> {
  factory $NftSellResponseEntityCopyWith(NftSellResponseEntity value,
          $Res Function(NftSellResponseEntity) then) =
      _$NftSellResponseEntityCopyWithImpl<$Res>;
  $Res call(
      {int? nftId,
      int? id,
      String? price,
      String? status,
      String? symbol,
      String? transactionsFee});
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
    Object? nftId = freezed,
    Object? id = freezed,
    Object? price = freezed,
    Object? status = freezed,
    Object? symbol = freezed,
    Object? transactionsFee = freezed,
  }) {
    return _then(_value.copyWith(
      nftId: nftId == freezed
          ? _value.nftId
          : nftId // ignore: cast_nullable_to_non_nullable
              as int?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      symbol: symbol == freezed
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionsFee: transactionsFee == freezed
          ? _value.transactionsFee
          : transactionsFee // ignore: cast_nullable_to_non_nullable
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
  $Res call(
      {int? nftId,
      int? id,
      String? price,
      String? status,
      String? symbol,
      String? transactionsFee});
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
    Object? nftId = freezed,
    Object? id = freezed,
    Object? price = freezed,
    Object? status = freezed,
    Object? symbol = freezed,
    Object? transactionsFee = freezed,
  }) {
    return _then(_$_NftSellResponseEntity(
      nftId: nftId == freezed
          ? _value.nftId
          : nftId // ignore: cast_nullable_to_non_nullable
              as int?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      symbol: symbol == freezed
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionsFee: transactionsFee == freezed
          ? _value.transactionsFee
          : transactionsFee // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_NftSellResponseEntity implements _NftSellResponseEntity {
  const _$_NftSellResponseEntity(
      {required this.nftId,
      required this.id,
      required this.price,
      required this.status,
      required this.symbol,
      required this.transactionsFee});

  @override
  final int? nftId;
  @override
  final int? id;
  @override
  final String? price;
  @override
  final String? status;
  @override
  final String? symbol;
  @override
  final String? transactionsFee;

  @override
  String toString() {
    return 'NftSellResponseEntity(nftId: $nftId, id: $id, price: $price, status: $status, symbol: $symbol, transactionsFee: $transactionsFee)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NftSellResponseEntity &&
            const DeepCollectionEquality().equals(other.nftId, nftId) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.symbol, symbol) &&
            const DeepCollectionEquality()
                .equals(other.transactionsFee, transactionsFee));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(nftId),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(symbol),
      const DeepCollectionEquality().hash(transactionsFee));

  @JsonKey(ignore: true)
  @override
  _$$_NftSellResponseEntityCopyWith<_$_NftSellResponseEntity> get copyWith =>
      __$$_NftSellResponseEntityCopyWithImpl<_$_NftSellResponseEntity>(
          this, _$identity);
}

abstract class _NftSellResponseEntity implements NftSellResponseEntity {
  const factory _NftSellResponseEntity(
      {required final int? nftId,
      required final int? id,
      required final String? price,
      required final String? status,
      required final String? symbol,
      required final String? transactionsFee}) = _$_NftSellResponseEntity;

  @override
  int? get nftId;
  @override
  int? get id;
  @override
  String? get price;
  @override
  String? get status;
  @override
  String? get symbol;
  @override
  String? get transactionsFee;
  @override
  @JsonKey(ignore: true)
  _$$_NftSellResponseEntityCopyWith<_$_NftSellResponseEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
