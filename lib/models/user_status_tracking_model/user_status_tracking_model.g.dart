// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_status_tracking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserStatusTrackingModel _$UserStatusTrackingModelFromJson(
        Map<String, dynamic> json) =>
    UserStatusTrackingModel(
      tracking: json['tracking'] == null
          ? null
          : TrackingModel.fromJson(json['tracking'] as Map<String, dynamic>),
      isAvailable: json['isAvailable'] as bool,
      availableAt: json['availableAt'] as int,
    );

Map<String, dynamic> _$UserStatusTrackingModelToJson(
        UserStatusTrackingModel instance) =>
    <String, dynamic>{
      'tracking': instance.tracking?.toJson(),
      'isAvailable': instance.isAvailable,
      'availableAt': instance.availableAt,
    };
