

import 'package:json_annotation/json_annotation.dart';

part 'sign_up_schema.g.dart';

@JsonSerializable()
class SignUpSchema{
  final String name;
  final String username;
  final String password;
  final String email;

  SignUpSchema(this.name, this.username, this.password, this.email);

  factory SignUpSchema.fromJson(Map<String, dynamic> json) =>
      _$SignUpSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpSchemaToJson(this);
}