import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:slee_fi/entities/nft_sell_response_entity/nft_sell_response_entity.dart';

part 'nft_sell_response.g.dart';

@JsonSerializable()
class NftSell {
  final int? nftId;
  final int? id;
  final String? price;
  final String? status;
  final String? symbol;
  final String? transactionsFee;

  NftSell({
    this.nftId,
    this.id,
    this.price,
    this.status,
    this.symbol,
    this.transactionsFee,
  });

  factory NftSell.fromJson(Map<String, dynamic> json) =>
      _$NftSellFromJson(json);

  Map<String, dynamic> toJson() => _$NftSellToJson(this);

  NftSellResponseEntity toEntity() => NftSellResponseEntity(
        symbol: symbol,
        transactionsFee: transactionsFee,
        status: status,
        nftId: nftId,
        id: id,
        price: price,
      );
}

