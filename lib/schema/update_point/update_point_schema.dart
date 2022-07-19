import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_point_schema.g.dart';

@JsonSerializable()
class UpdatePointSchema {
  final int bedId;
  final double efficiency;
  final double luck;
  final double bonus;
  final double special;
  final double resilience;

  UpdatePointSchema({
    required this.bedId,
    required this.efficiency,
    required this.luck,
    required this.bonus,
    required this.special,
    required this.resilience,
  });

  factory UpdatePointSchema.fromJson(Map<String, dynamic> json) =>
      _$UpdatePointSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$UpdatePointSchemaToJson(this);
}
