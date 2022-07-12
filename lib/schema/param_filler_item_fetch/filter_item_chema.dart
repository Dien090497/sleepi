import 'package:json_annotation/json_annotation.dart';

part 'filter_item_chema.g.dart';

@JsonSerializable()
class FilterItemSchema {
  final int page;
  final int limit;
  final int level;
  final List<String> type;

  FilterItemSchema(this.page, this.limit, this.level, this.type);

  factory FilterItemSchema.fromJson(Map<String, dynamic> json) =>
      _$FilterItemSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$FilterItemSchemaToJson(this);
}
