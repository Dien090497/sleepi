import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_entity.freezed.dart';

@freezed
class HistoryEntity with _$HistoryEntity {
  const factory HistoryEntity({
    required String? transactionHash,
    required int chainId,
    required String addressToken,
    required String tokenSymbol,
    //  EtherAmount? value,
    //  BlockNum? blockNumber,
    //  EthereumAddress? from,
    // required int gas,
    //  EtherAmount? gasPrice,
    // required String hash,
    // required int nonce,
    // EthereumAddress? to,
    // int? transactionIndex,
  }) = _HistoryEntity;
}
