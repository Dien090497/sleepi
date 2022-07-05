import 'package:json_annotation/json_annotation.dart';

part 'sign_up_schema.g.dart';

@JsonSerializable()
class SignUpSchema {
  final int otp;

  final String email;

  factory SignUpSchema.fromJson(Map<String, dynamic> json) =>
      _$SignUpSchemaFromJson(json);

  SignUpSchema(this.otp, this.email);

  Map<String, dynamic> toJson() => _$SignUpSchemaToJson(this);
}
