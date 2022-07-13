import 'package:freezed_annotation/freezed_annotation.dart';

part 'whit_draw_token_schema.g.dart';

@JsonSerializable()
class WhitDrawTokenSchema {
  final String type;
  final String tokenAddress;
  final String amount;
  final String? signedMessage;
  final String? signer;


  WhitDrawTokenSchema({required this.type, required this.tokenAddress, required this.amount, this.signedMessage, this.signer});

  factory WhitDrawTokenSchema.fromJson(Map<String, dynamic> json) =>
      _$WhitDrawTokenSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$WhitDrawTokenSchemaToJson(this);
}
