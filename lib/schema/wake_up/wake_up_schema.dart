import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wake_up_schema.g.dart';

@JsonSerializable()
class WakeUpSchema {
  final String bedTime;
  final String sleepOnsetTime;
  final String wokeUp;
  final String startSleepTime;
  final String nocAwake;
  final String sleepDuration;

  WakeUpSchema({
    required this.bedTime,
    required this.sleepOnsetTime,
    required this.wokeUp,
    required this.startSleepTime,
    required this.nocAwake,
    required this.sleepDuration,
  });

  factory WakeUpSchema.fromJson(Map<String, dynamic> json) =>
      _$WakeUpSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$WakeUpSchemaToJson(this);
}
