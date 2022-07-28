import 'package:json_annotation/json_annotation.dart';
import 'package:slee_fi/models/gacha_probability_config_response/config_info.dart';

part 'probability_config.g.dart';

@JsonSerializable()
class ProbabilityConfig{
  @JsonKey(name: 'Bed')
  final List<ConfigInfo> bed;
  @JsonKey(name: 'Token')
  final List<ConfigInfo> token;
  @JsonKey(name: 'Items')
  final List<ConfigInfo> items;
  @JsonKey(name: 'Jewels')
  final List<ConfigInfo> jewels;

  ProbabilityConfig({
    required this.bed,
    required this.token,
    required this.items,
    required this.jewels,
  });
  factory ProbabilityConfig.fromJson(Map<String, dynamic> json) => _$ProbabilityConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ProbabilityConfigToJson(this);
}
