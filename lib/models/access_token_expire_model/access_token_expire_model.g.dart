// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_token_expire_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccessTokenExpireModel _$AccessTokenExpireModelFromJson(
        Map<String, dynamic> json) =>
    AccessTokenExpireModel(
      _Error.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AccessTokenExpireModelToJson(
        AccessTokenExpireModel instance) =>
    <String, dynamic>{
      'error': instance.error.toJson(),
    };

_Error _$ErrorFromJson(Map<String, dynamic> json) => _Error(
      json['statusCode'] as int?,
      json['message'] as String?,
      json['errorName'] as String?,
      json['details'] == null
          ? null
          : _Details.fromJson(json['details'] as Map<String, dynamic>),
      json['path'] as String?,
      json['requestId'] as String?,
      json['timestamp'] as String?,
    );

Map<String, dynamic> _$ErrorToJson(_Error instance) => <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'errorName': instance.errorName,
      'details': instance.details?.toJson(),
      'path': instance.path,
      'requestId': instance.requestId,
      'timestamp': instance.timestamp,
    };

_Details _$DetailsFromJson(Map<String, dynamic> json) => _Details(
      json['statusCode'] as int?,
      json['message'] as String?,
      json['error'] as String?,
    );

Map<String, dynamic> _$DetailsToJson(_Details instance) => <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'error': instance.error,
    };
