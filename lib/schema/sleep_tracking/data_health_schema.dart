
import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_health_schema.g.dart';
@JsonSerializable()
class DataHealthSchema {
  
  int? trackingId;
  String? dataType;
  String? value;
  String? platformType;
  String? unit;
  String? dateFrom;
  String? dateTo;
  String? sourceName;
  String? sourceId;
  
  DataHealthSchema({
    this.trackingId,
    this.dataType,
    this.value,
    this.platformType,
    this.unit,
    this.dateFrom,
    this.dateTo,
    this.sourceName,
    this.sourceId,
  });

  factory DataHealthSchema.fromJson(Map<String, dynamic> json) =>
      _$DataHealthSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$DataHealthSchemaToJson(this);
}
