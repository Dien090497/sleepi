import 'package:json_annotation/json_annotation.dart';
import 'package:slee_fi/models/gacha_probability_config_response/config_info.dart';

part 'probability_config.g.dart';

@JsonSerializable()
class ProbabilityConfig{
  final List<ConfigInfo> configs;

  ProbabilityConfig({
    required this.configs,
  });
  factory ProbabilityConfig.fromJson(Map<String, dynamic> json) => _$ProbabilityConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ProbabilityConfigToJson(this);
}
