import 'package:json_annotation/json_annotation.dart';
import 'package:slee_fi/common/enum/enum.dart';
part 'verify_schema.g.dart';


@JsonSerializable()
class VerifySchema {
  final int otp;
  final String email;
  final OTPType otpType;

  VerifySchema(this.otp, this.email, this.otpType);

  factory VerifySchema.fromJson(Map<String, dynamic> json) => _$VerifySchemaFromJson(json);

  Map<String, dynamic> toJson() => _$VerifySchemaToJson(this);
}
