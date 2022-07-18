import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:slee_fi/entities/point_of_owner/point_of_owner_entity.dart';

part 'point_of_owner_model.g.dart';

@JsonSerializable()
class PointOfOwnerModel {
  final double bedPoint;

  PointOfOwnerModel(this.bedPoint);

  factory PointOfOwnerModel.fromJson(Map<String, dynamic> json) =>
      _$PointOfOwnerModelFromJson(json);

  Map<String, dynamic> toJson() => _$PointOfOwnerModelToJson(this);

  PointOfOwnerEntity toEntity() => PointOfOwnerEntity(point: bedPoint);
}
