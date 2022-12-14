import 'package:json_annotation/json_annotation.dart';

part 'filter_item_schema.g.dart';

@JsonSerializable()
class FilterItemSchema {
  int page;
  final int limit;
  int minLevel;
  int maxLevel;
  List<String> type;

  FilterItemSchema(
      {required this.page,
      required this.limit,
      required this.maxLevel,
      required this.minLevel,
      required this.type});

  factory FilterItemSchema.fromJson(Map<String, dynamic> json) =>
      _$FilterItemSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$FilterItemSchemaToJson(this);
}
