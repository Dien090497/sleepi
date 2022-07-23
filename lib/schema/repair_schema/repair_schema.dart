import 'package:freezed_annotation/freezed_annotation.dart';

part 'repair_schema.g.dart';

@JsonSerializable()
class RepairSchema {
  final int bedId;
  final int durability;


  RepairSchema({required this.bedId, required this.durability});

  factory RepairSchema.fromJson(Map<String, dynamic> json) =>
      _$RepairSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$RepairSchemaToJson(this);
}
