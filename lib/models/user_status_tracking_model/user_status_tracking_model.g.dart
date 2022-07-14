// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_status_tracking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserStatusTrackingModel _$UserStatusTrackingModelFromJson(
        Map<String, dynamic> json) =>
    UserStatusTrackingModel(
      json['tracking'] as int,
      json['isAvailable'] as bool,
      json['availableAt'] as int,
    );

Map<String, dynamic> _$UserStatusTrackingModelToJson(
        UserStatusTrackingModel instance) =>
    <String, dynamic>{
      'tracking': instance.tracking,
      'isAvailable': instance.isAvailable,
      'availableAt': instance.availableAt,
    };
