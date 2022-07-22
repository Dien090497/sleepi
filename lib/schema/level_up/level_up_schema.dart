
import 'package:freezed_annotation/freezed_annotation.dart';

part 'level_up_schema.g.dart';

@JsonSerializable()
class LevelUpSchema {
  LevelUpSchema({required this.bedId, required this.cost});

  final int bedId;
  final double cost;

  factory LevelUpSchema.fromJson(Map<String, dynamic> json) =>
      _$LevelUpSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$LevelUpSchemaToJson(this);
}