import 'package:json_annotation/json_annotation.dart';

part 'config_slft.g.dart';

@JsonSerializable()
class ConfigSlft{
  final double? percent;

  ConfigSlft({
    required this.percent,
  });
  factory ConfigSlft.fromJson(Map<String, dynamic> json) => _$ConfigSlftFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigSlftToJson(this);
}
