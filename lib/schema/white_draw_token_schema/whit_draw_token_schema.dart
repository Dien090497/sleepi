import 'package:freezed_annotation/freezed_annotation.dart';

part 'whit_draw_token_schema.g.dart';

@JsonSerializable()
class WhitDrawTokenSchema {
  final String type;
  final String tokenAddress;
  final String amount;

  WhitDrawTokenSchema(this.type, this.tokenAddress, this.amount);

  factory WhitDrawTokenSchema.fromJson(Map<String, dynamic> json) =>
      _$WhitDrawTokenSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$WhitDrawTokenSchemaToJson(this);
}
