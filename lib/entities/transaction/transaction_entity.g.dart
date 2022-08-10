// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_entity.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TransactionEntityCWProxy {
  TransactionEntity blockHash(String? blockHash);

  TransactionEntity blockNumber(BlockNum blockNumber);

  TransactionEntity from(EthereumAddress from);

  TransactionEntity gas(int gas);

  TransactionEntity gasPrice(EtherAmount gasPrice);

  TransactionEntity hash(String hash);

  TransactionEntity input(Uint8List input);

  TransactionEntity nonce(int nonce);

  TransactionEntity r(BigInt r);

  TransactionEntity s(BigInt s);

  TransactionEntity to(EthereumAddress? to);

  TransactionEntity transactionIndex(int? transactionIndex);

  TransactionEntity v(int v);

  TransactionEntity value(EtherAmount value);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TransactionEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TransactionEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  TransactionEntity call({
    String? blockHash,
    BlockNum? blockNumber,
    EthereumAddress? from,
    int? gas,
    EtherAmount? gasPrice,
    String? hash,
    Uint8List? input,
    int? nonce,
    BigInt? r,
    BigInt? s,
    EthereumAddress? to,
    int? transactionIndex,
    int? v,
    EtherAmount? value,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTransactionEntity.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTransactionEntity.copyWith.fieldName(...)`
class _$TransactionEntityCWProxyImpl implements _$TransactionEntityCWProxy {
  final TransactionEntity _value;

  const _$TransactionEntityCWProxyImpl(this._value);

  @override
  TransactionEntity blockHash(String? blockHash) => this(blockHash: blockHash);

  @override
  TransactionEntity blockNumber(BlockNum blockNumber) =>
      this(blockNumber: blockNumber);

  @override
  TransactionEntity from(EthereumAddress from) => this(from: from);

  @override
  TransactionEntity gas(int gas) => this(gas: gas);

  @override
  TransactionEntity gasPrice(EtherAmount gasPrice) => this(gasPrice: gasPrice);

  @override
  TransactionEntity hash(String hash) => this(hash: hash);

  @override
  TransactionEntity input(Uint8List input) => this(input: input);

  @override
  TransactionEntity nonce(int nonce) => this(nonce: nonce);

  @override
  TransactionEntity r(BigInt r) => this(r: r);

  @override
  TransactionEntity s(BigInt s) => this(s: s);

  @override
  TransactionEntity to(EthereumAddress? to) => this(to: to);

  @override
  TransactionEntity transactionIndex(int? transactionIndex) =>
      this(transactionIndex: transactionIndex);

  @override
  TransactionEntity v(int v) => this(v: v);

  @override
  TransactionEntity value(EtherAmount value) => this(value: value);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TransactionEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TransactionEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  TransactionEntity call({
    Object? blockHash = const $CopyWithPlaceholder(),
    Object? blockNumber = const $CopyWithPlaceholder(),
    Object? from = const $CopyWithPlaceholder(),
    Object? gas = const $CopyWithPlaceholder(),
    Object? gasPrice = const $CopyWithPlaceholder(),
    Object? hash = const $CopyWithPlaceholder(),
    Object? input = const $CopyWithPlaceholder(),
    Object? nonce = const $CopyWithPlaceholder(),
    Object? r = const $CopyWithPlaceholder(),
    Object? s = const $CopyWithPlaceholder(),
    Object? to = const $CopyWithPlaceholder(),
    Object? transactionIndex = const $CopyWithPlaceholder(),
    Object? v = const $CopyWithPlaceholder(),
    Object? value = const $CopyWithPlaceholder(),
  }) {
    return TransactionEntity(
      blockHash: blockHash == const $CopyWithPlaceholder()
          ? _value.blockHash
          // ignore: cast_nullable_to_non_nullable
          : blockHash as String?,
      blockNumber:
          blockNumber == const $CopyWithPlaceholder() || blockNumber == null
              ? _value.blockNumber
              // ignore: cast_nullable_to_non_nullable
              : blockNumber as BlockNum,
      from: from == const $CopyWithPlaceholder() || from == null
          ? _value.from
          // ignore: cast_nullable_to_non_nullable
          : from as EthereumAddress,
      gas: gas == const $CopyWithPlaceholder() || gas == null
          ? _value.gas
          // ignore: cast_nullable_to_non_nullable
          : gas as int,
      gasPrice: gasPrice == const $CopyWithPlaceholder() || gasPrice == null
          ? _value.gasPrice
          // ignore: cast_nullable_to_non_nullable
          : gasPrice as EtherAmount,
      hash: hash == const $CopyWithPlaceholder() || hash == null
          ? _value.hash
          // ignore: cast_nullable_to_non_nullable
          : hash as String,
      input: input == const $CopyWithPlaceholder() || input == null
          ? _value.input
          // ignore: cast_nullable_to_non_nullable
          : input as Uint8List,
      nonce: nonce == const $CopyWithPlaceholder() || nonce == null
          ? _value.nonce
          // ignore: cast_nullable_to_non_nullable
          : nonce as int,
      r: r == const $CopyWithPlaceholder() || r == null
          ? _value.r
          // ignore: cast_nullable_to_non_nullable
          : r as BigInt,
      s: s == const $CopyWithPlaceholder() || s == null
          ? _value.s
          // ignore: cast_nullable_to_non_nullable
          : s as BigInt,
      to: to == const $CopyWithPlaceholder()
          ? _value.to
          // ignore: cast_nullable_to_non_nullable
          : to as EthereumAddress?,
      transactionIndex: transactionIndex == const $CopyWithPlaceholder()
          ? _value.transactionIndex
          // ignore: cast_nullable_to_non_nullable
          : transactionIndex as int?,
      v: v == const $CopyWithPlaceholder() || v == null
          ? _value.v
          // ignore: cast_nullable_to_non_nullable
          : v as int,
      value: value == const $CopyWithPlaceholder() || value == null
          ? _value.value
          // ignore: cast_nullable_to_non_nullable
          : value as EtherAmount,
    );
  }
}

extension $TransactionEntityCopyWith on TransactionEntity {
  /// Returns a callable class that can be used as follows: `instanceOfTransactionEntity.copyWith(...)` or like so:`instanceOfTransactionEntity.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TransactionEntityCWProxy get copyWith =>
      _$TransactionEntityCWProxyImpl(this);
}
