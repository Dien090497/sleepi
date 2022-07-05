

import 'package:json_annotation/json_annotation.dart';

part 'verify_user_schema.g.dart';

@JsonSerializable()
class VerifyUserSchema {
  final String message;
  final String signedMessage;
  final String signer;
  final String email;

  VerifyUserSchema(this.message, this.signedMessage, this.signer, this.email);

  factory VerifyUserSchema.fromJson(Map<String, dynamic> json) =>
      _$VerifyUserSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyUserSchemaToJson(this);
}
