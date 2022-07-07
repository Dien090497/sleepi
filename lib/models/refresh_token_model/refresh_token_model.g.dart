// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefreshTokenModel _$RefreshTokenModelFromJson(Map<String, dynamic> json) =>
    RefreshTokenModel(
      _Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RefreshTokenModelToJson(RefreshTokenModel instance) =>
    <String, dynamic>{
      'data': instance.data.toJson(),
    };

_Data _$DataFromJson(Map<String, dynamic> json) => _Data(
      json['accessToken'] as String,
      json['refreshToken'] as String,
    );

Map<String, dynamic> _$DataToJson(_Data instance) => <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
