import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password_schema.g.dart';

@JsonSerializable()
class ChangePasswordSchema {
  final String email;
  final int otp;
  final String newPassword;
  final String confirmPassword;

  ChangePasswordSchema(
      this.email, this.otp, this.newPassword, this.confirmPassword);

  factory ChangePasswordSchema.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordSchemaToJson(this);
}
