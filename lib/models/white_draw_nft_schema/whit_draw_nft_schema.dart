import 'package:freezed_annotation/freezed_annotation.dart';

part 'whit_draw_nft_schema.g.dart';

@JsonSerializable()
class WhitDrawNFTSchema {
  final String type;
  final String symbol;
  final String amount;
  final String mainWallet;

  WhitDrawNFTSchema(this.type, this.symbol, this.amount, this.mainWallet);

  factory WhitDrawNFTSchema.fromJson(Map<String, dynamic> json) =>
      _$WhitDrawNFTSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$WhitDrawNFTSchemaToJson(this);
}
