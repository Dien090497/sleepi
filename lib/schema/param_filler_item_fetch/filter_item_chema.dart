import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'filter_item_chema.g.dart';

@JsonSerializable()
class FilterItemSchema {
  int page;
  final int limit;
  int level;
  List<String> type;

  FilterItemSchema(
      {required this.page,
      required this.limit,
      required this.level,
      required this.type});

  factory FilterItemSchema.fromJson(Map<String, dynamic> json) =>
      _$FilterItemSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$FilterItemSchemaToJson(this);
}
