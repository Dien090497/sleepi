import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_password_schema.g.dart';
@JsonSerializable()
class CreatePasswordSchema {
  final String email;
  final String password;
  final String activeCode;
  final int otp;

  CreatePasswordSchema(this.email, this.password, this.activeCode, this.otp);

  factory CreatePasswordSchema.fromJson(Map<String, dynamic> json) =>
      _$CreatePasswordSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$CreatePasswordSchemaToJson(this);
}
