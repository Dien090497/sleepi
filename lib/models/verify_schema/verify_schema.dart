import 'package:json_annotation/json_annotation.dart';
import 'package:slee_fi/common/enum/enum.dart';
part 'verify_schema.g.dart';


@JsonSerializable()
class VerifyOTPSchema {
  final int otp;
  final String email;
  final OTPType otpType;

  VerifyOTPSchema(this.otp, this.email, this.otpType);

  factory VerifyOTPSchema.fromJson(Map<String, dynamic> json) => _$VerifyOTPSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyOTPSchemaToJson(this);
}
