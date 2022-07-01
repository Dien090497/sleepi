import 'package:freezed_annotation/freezed_annotation.dart';

part 'whit_draw_token_schema.g.dart';

@JsonSerializable()
class WhitDrawTokenSchema {
  final String type;
  final String symbol;
  final String amount;
  final String mainWallet;

  WhitDrawTokenSchema(this.type, this.symbol, this.amount, this.mainWallet);

  factory WhitDrawTokenSchema.fromJson(Map<String, dynamic> json) =>
      _$WhitDrawTokenSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$WhitDrawTokenSchemaToJson(this);
}
