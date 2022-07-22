import 'package:json_annotation/json_annotation.dart';

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
