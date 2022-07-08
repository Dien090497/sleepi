// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_buy_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultBuyModel _$ResultBuyModelFromJson(Map<String, dynamic> json) =>
    ResultBuyModel(
      status: json['status'] as bool,
      message: json['message'] as String,
    );

Map<String, dynamic> _$ResultBuyModelToJson(ResultBuyModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
