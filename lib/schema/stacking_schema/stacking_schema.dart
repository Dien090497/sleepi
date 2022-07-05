import 'package:freezed_annotation/freezed_annotation.dart';

part 'stacking_schema.g.dart';
@JsonSerializable()
class StackingSchema {
  final int amount;
  final String symbol;

  StackingSchema(this.amount, this.symbol);

  factory StackingSchema.fromJson(Map<String, dynamic> json) =>
      _$StackingSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$StackingSchemaToJson(this);
}
