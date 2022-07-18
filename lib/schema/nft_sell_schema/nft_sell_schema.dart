import 'package:freezed_annotation/freezed_annotation.dart';

part 'nft_sell_schema.g.dart';

@JsonSerializable()
class NFTSellSchema {
  final int nftId;
  final String amount;

  NFTSellSchema({required this.nftId, required this.amount});

  factory NFTSellSchema.fromJson(Map<String, dynamic> json) =>
      _$NFTSellSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$NFTSellSchemaToJson(this);
}
