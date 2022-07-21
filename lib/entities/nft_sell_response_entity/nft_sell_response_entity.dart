import 'package:freezed_annotation/freezed_annotation.dart';

part 'nft_sell_response_entity.freezed.dart';

@freezed
class NftSellResponseEntity with _$NftSellResponseEntity {
  const factory NftSellResponseEntity({
    required String? message,
  }) = _NftSellResponseEntity;
}
