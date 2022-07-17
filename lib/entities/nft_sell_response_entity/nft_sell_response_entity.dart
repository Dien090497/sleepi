import 'package:freezed_annotation/freezed_annotation.dart';

part 'nft_sell_response_entity.freezed.dart';

@freezed
class NftSellResponseEntity with _$NftSellResponseEntity {
  const factory NftSellResponseEntity({
    required int? nftId,
    required int? id,
    required String? price,
    required String? status,
    required String? symbol,
    required String? transactionsFee,
  }) = _NftSellResponseEntity;
}
