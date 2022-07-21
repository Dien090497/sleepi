import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:slee_fi/entities/nft_sell_response_entity/nft_sell_response_entity.dart';

part 'nft_sell_response.g.dart';

@JsonSerializable()
class NftSell {
  final String? message;

  NftSell({
    this.message,
  });

  factory NftSell.fromJson(Map<String, dynamic> json) =>
      _$NftSellFromJson(json);

  Map<String, dynamic> toJson() => _$NftSellToJson(this);

  NftSellResponseEntity toEntity() => NftSellResponseEntity(
        message: message
      );
}

