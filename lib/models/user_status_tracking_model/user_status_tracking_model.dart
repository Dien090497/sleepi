import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:slee_fi/models/user_status_tracking_model/tracking_model.dart';

part 'user_status_tracking_model.g.dart';

@JsonSerializable()
class UserStatusTrackingModel {
  final TrackingModel? tracking;
  final bool isAvailable;
  final int availableAt;

  UserStatusTrackingModel({this.tracking, required this.isAvailable, required this.availableAt});

  factory UserStatusTrackingModel.fromJson(Map<String, dynamic> json) =>
      _$UserStatusTrackingModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserStatusTrackingModelToJson(this);
}
