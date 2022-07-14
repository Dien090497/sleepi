import 'package:json_annotation/json_annotation.dart';

part 'data_health.g.dart';

@JsonSerializable()
class DataHealth {
  String? dataType;
  String? value;
  String? platformType;
  String? unit;
  String? dateFrom;
  String? dateTo;
  String? sourceName;
  String? sourceId;

  DataHealth({
    this.dataType,
    this.value,
    this.platformType,
    this.unit,
    this.dateFrom,
    this.dateTo,
    this.sourceName,
    this.sourceId,
  });

  factory DataHealth.fromJson(Map<String, dynamic> json) =>
      _$DataHealthFromJson(json);

  Map<String, dynamic> toJson() => _$DataHealthToJson(this);

}