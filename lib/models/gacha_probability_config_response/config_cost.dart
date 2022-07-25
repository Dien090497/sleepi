import 'package:json_annotation/json_annotation.dart';

part 'config_cost.g.dart';

@JsonSerializable()
class ConfigCost{
  @JsonKey(name: 'NORMAL_GACHA_SINGLE')
  final int? normalGachaSingle;
  @JsonKey(name: 'SPECIAL_GACHA_SINGLE')
  final int? normalGachaMultiple;
  @JsonKey(name: 'NORMAL_GACHA_MULTIPLE')
  final int? specialGachaSingle;
  @JsonKey(name: 'SPECIAL_GACHA_MULTIPLE')
  final int? specialGachaMultiple;

  ConfigCost({
    required this.normalGachaSingle,
    required this.normalGachaMultiple,
    required this.specialGachaSingle,
    required this.specialGachaMultiple,
  });
  factory ConfigCost.fromJson(Map<String, dynamic> json) => _$ConfigCostFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigCostToJson(this);
}
