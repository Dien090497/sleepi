// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersResponse _$UsersResponseFromJson(Map<String, dynamic> json) =>
    UsersResponse(
      json['meta'],
      (json['data'] as List<dynamic>)
          .map((e) => UserInfoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UsersResponseToJson(UsersResponse instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };
