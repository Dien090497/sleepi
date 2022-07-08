import 'package:freezed_annotation/freezed_annotation.dart';

part 'stacking_schema.g.dart';
@JsonSerializable()
class StackingSchema {
  final String amount;

  StackingSchema({required this.amount});

  factory StackingSchema.fromJson(Map<String, dynamic> json) =>
      _$StackingSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$StackingSchemaToJson(this);
}
