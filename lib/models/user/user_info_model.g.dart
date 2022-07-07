// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoModel _$UserInfoModelFromJson(Map<String, dynamic> json) =>
    UserInfoModel(
      json['id'] as int,
      json['name'] as String?,
      json['username'] as String?,
      (json['roles'] as List<dynamic>).map((e) => e as String).toList(),
      json['email'] as String,
      json['isAccountDisabled'] as bool,
      json['createdAt'] as String,
      json['updatedAt'] as String,
      json['wallet'] as String?,
    );

Map<String, dynamic> _$UserInfoModelToJson(UserInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'roles': instance.roles,
      'email': instance.email,
      'isAccountDisabled': instance.isAccountDisabled,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'wallet': instance.wallet,
    };
