import 'package:freezed_annotation/freezed_annotation.dart';

part 'unstacking_schema.g.dart';
@JsonSerializable()
class UnStackingSchema {
  final int amount;
  final String symbol;

  UnStackingSchema(this.amount, this.symbol);

  factory UnStackingSchema.fromJson(Map<String, dynamic> json) =>
      _$UnStackingSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$UnStackingSchemaToJson(this);
}
