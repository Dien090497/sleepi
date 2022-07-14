import 'package:json_annotation/json_annotation.dart';

part 'speed_up_lucky_box_schema.g.dart';

@JsonSerializable()
class SpeedUpLuckyBoxSchema {
  final int luckyBoxId;

  SpeedUpLuckyBoxSchema(this.luckyBoxId);

  factory SpeedUpLuckyBoxSchema.fromJson(Map<String, dynamic> json) =>
      _$SpeedUpLuckyBoxSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$SpeedUpLuckyBoxSchemaToJson(this);
}
