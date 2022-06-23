// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_isar_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TransactionIsarModelCWProxy {
  TransactionIsarModel gasPrice(double? gasPrice);

  TransactionIsarModel maxGas(int? maxGas);

  TransactionIsarModel toAddress(String toAddress);

  TransactionIsarModel transactionHash(String? transactionHash);

  TransactionIsarModel valueInEther(double valueInEther);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TransactionIsarModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TransactionIsarModel(...).copyWith(id: 12, name: "My name")
  /// ````
  TransactionIsarModel call({
    double? gasPrice,
    int? maxGas,
    String? toAddress,
    String? transactionHash,
    double? valueInEther,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTransactionIsarModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTransactionIsarModel.copyWith.fieldName(...)`
class _$TransactionIsarModelCWProxyImpl
    implements _$TransactionIsarModelCWProxy {
  final TransactionIsarModel _value;

  const _$TransactionIsarModelCWProxyImpl(this._value);

  @override
  TransactionIsarModel gasPrice(double? gasPrice) => this(gasPrice: gasPrice);

  @override
  TransactionIsarModel maxGas(int? maxGas) => this(maxGas: maxGas);

  @override
  TransactionIsarModel toAddress(String toAddress) =>
      this(toAddress: toAddress);

  @override
  TransactionIsarModel transactionHash(String? transactionHash) =>
      this(transactionHash: transactionHash);

  @override
  TransactionIsarModel valueInEther(double valueInEther) =>
      this(valueInEther: valueInEther);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TransactionIsarModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TransactionIsarModel(...).copyWith(id: 12, name: "My name")
  /// ````
  TransactionIsarModel call({
    Object? gasPrice = const $CopyWithPlaceholder(),
    Object? maxGas = const $CopyWithPlaceholder(),
    Object? toAddress = const $CopyWithPlaceholder(),
    Object? transactionHash = const $CopyWithPlaceholder(),
    Object? valueInEther = const $CopyWithPlaceholder(),
  }) {
    return TransactionIsarModel(
      gasPrice: gasPrice == const $CopyWithPlaceholder()
          ? _value.gasPrice
          // ignore: cast_nullable_to_non_nullable
          : gasPrice as double?,
      maxGas: maxGas == const $CopyWithPlaceholder()
          ? _value.maxGas
          // ignore: cast_nullable_to_non_nullable
          : maxGas as int?,
      toAddress: toAddress == const $CopyWithPlaceholder() || toAddress == null
          ? _value.toAddress
          // ignore: cast_nullable_to_non_nullable
          : toAddress as String,
      transactionHash: transactionHash == const $CopyWithPlaceholder()
          ? _value.transactionHash
          // ignore: cast_nullable_to_non_nullable
          : transactionHash as String?,
      valueInEther:
          valueInEther == const $CopyWithPlaceholder() || valueInEther == null
              ? _value.valueInEther
              // ignore: cast_nullable_to_non_nullable
              : valueInEther as double,
    );
  }
}

extension $TransactionIsarModelCopyWith on TransactionIsarModel {
  /// Returns a callable class that can be used as follows: `instanceOfTransactionIsarModel.copyWith(...)` or like so:`instanceOfTransactionIsarModel.copyWith.fieldName(...)`.
  _$TransactionIsarModelCWProxy get copyWith =>
      _$TransactionIsarModelCWProxyImpl(this);
}
