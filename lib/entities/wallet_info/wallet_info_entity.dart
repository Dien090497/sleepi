import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/native_currency/native_currency_entity.dart';
import 'package:slee_fi/entities/transaction/transaction_entity.dart';
import 'package:web3dart/credentials.dart';

part 'wallet_info_entity.freezed.dart';

@freezed
class WalletInfoEntity with _$WalletInfoEntity {
  const factory WalletInfoEntity({
    required int id,
    required NativeCurrencyEntity nativeCurrency,
    required String address,
    required String networkName,
    required String name,
    required Credentials credentials,
    required int chainID,
    int? derivedIndex,
    @Default(false) bool isImported,
    // @Default([]) List<TokenEntity> tokens,
    @Default([]) List<String> nfts,
    @Default([]) List<TransactionEntity> transactions,
    @Default('') String image,
  }) = _WalletInfoEntity;
}
