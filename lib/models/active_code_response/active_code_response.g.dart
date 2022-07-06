// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_code_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActiveCodeResponse _$ActiveCodeResponseFromJson(Map<String, dynamic> json) =>
    ActiveCodeResponse(
      (json['data'] as List<dynamic>)
          .map((e) => ActiveCode.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ActiveCodeResponseToJson(ActiveCodeResponse instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };
