// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyOTPSchema _$VerifyOTPSchemaFromJson(Map<String, dynamic> json) =>
    VerifyOTPSchema(
      json['otp'] as int,
      json['email'] as String,
      $enumDecode(_$OTPTypeEnumMap, json['otpType']),
    );

Map<String, dynamic> _$VerifyOTPSchemaToJson(VerifyOTPSchema instance) =>
    <String, dynamic>{
      'otp': instance.otp,
      'email': instance.email,
      'otpType': instance.otpType.toJson(),
    };

const _$OTPTypeEnumMap = {
  OTPType.signUp: 'signUp',
  OTPType.addWallet: 'addWallet',
  OTPType.changePass: 'changePass',
  OTPType.importWallet: 'importWallet',
};
