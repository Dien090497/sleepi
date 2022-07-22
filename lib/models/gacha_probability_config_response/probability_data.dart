import 'package:json_annotation/json_annotation.dart';
import 'package:slee_fi/models/gacha_probability_config_response/probability_config.dart';

part 'probability_data.g.dart';

@JsonSerializable()
class ProbabilityData{
  final String? key;
  final dynamic config;

  ProbabilityData({
    required this.key,
    required this.config,
  });
  factory ProbabilityData.fromJson(Map<String, dynamic> json) => _$ProbabilityDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProbabilityDataToJson(this);
}
