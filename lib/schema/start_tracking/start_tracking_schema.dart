import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'start_tracking_schema.g.dart';

@JsonSerializable()
class StartTrackingSchema {
  final bool isEnableInsurance;
  final bool alrm;
  final String wakeUp;
  final int itemUsed;
  final int bedUsed;

  StartTrackingSchema({
    required this.isEnableInsurance,
    required this.alrm,
    required this.wakeUp,
    required this.itemUsed,
    required this.bedUsed,
  });

  factory StartTrackingSchema.fromJson(Map<String, dynamic> json) =>
      _$StartTrackingSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$StartTrackingSchemaToJson(this);
}
