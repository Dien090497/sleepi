import 'package:json_annotation/json_annotation.dart';
import 'package:slee_fi/models/gacha_probability_config_response/probability_data.dart';

part 'gacha_probability_config_response.g.dart';

@JsonSerializable()
class GachaProbabilityConfigResponse{
  final String status;
  final List<ProbabilityData> data;

  GachaProbabilityConfigResponse({
    required this.status,
    required this.data,
  });
  factory GachaProbabilityConfigResponse.fromJson(Map<String, dynamic> json) => _$GachaProbabilityConfigResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GachaProbabilityConfigResponseToJson(this);
}
