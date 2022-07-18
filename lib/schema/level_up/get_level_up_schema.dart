
// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_level_up_schema.g.dart';
@JsonSerializable()
class GetLevelUpSchema {
  GetLevelUpSchema({
    required this.next_level,
    required this.sleep_time,
  });

  final int next_level;
  final int sleep_time;

  factory GetLevelUpSchema.fromJson(Map<String, dynamic> json) =>
      _$GetLevelUpSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$GetLevelUpSchemaToJson(this);
}