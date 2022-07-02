import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_password_schema.g.dart';
@JsonSerializable()
class CreatePasscodeSchema {
  final String email;
  final String password;
  final String activeCode;
  final int otp;

  CreatePasscodeSchema(this.email, this.password, this.activeCode, this.otp);

  factory CreatePasscodeSchema.fromJson(Map<String, dynamic> json) =>
      _$CreatePasscodeSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$CreatePasscodeSchemaToJson(this);
}
