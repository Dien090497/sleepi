
import 'package:freezed_annotation/freezed_annotation.dart';

import 'data_health.dart';

part 'data_health_schema.g.dart';
@JsonSerializable()
class DataHealthSchema {
  
  List<DataHealth>? listData;
  
  DataHealthSchema({
    this.listData,
  });

  factory DataHealthSchema.fromJson(Map<String, dynamic> json) =>
      _$DataHealthSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$DataHealthSchemaToJson(this);

}

