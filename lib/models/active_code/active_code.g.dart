// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActiveCode _$ActiveCodeFromJson(Map<String, dynamic> json) => ActiveCode(
      json['id'] as int,
      json['userId'] as int,
      json['code'] as String,
      json['expired'] as String?,
      json['codeUsedAt'] as String?,
      json['isUsed'] as bool,
      json['friend'] as String?,
    );

Map<String, dynamic> _$ActiveCodeToJson(ActiveCode instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'code': instance.code,
      'expired': instance.expired,
      'codeUsedAt': instance.codeUsedAt,
      'isUsed': instance.isUsed,
      'friend': instance.friend,
    };
