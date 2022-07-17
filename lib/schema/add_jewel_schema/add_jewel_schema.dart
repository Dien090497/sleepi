import 'package:json_annotation/json_annotation.dart';

part 'add_jewel_schema.g.dart';

@JsonSerializable()
class AddJewelSchema {
  final int bedId;
  final int jewelId;

  AddJewelSchema(this.bedId, this.jewelId);

  factory AddJewelSchema.fromJson(Map<String, dynamic> json) =>
      _$AddJewelSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$AddJewelSchemaToJson(this);
}
