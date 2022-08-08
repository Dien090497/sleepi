import 'package:json_annotation/json_annotation.dart';

part 'estimate_sleep_response.g.dart';

@JsonSerializable()
class EstimateSleepResponse {
  final double todayEarn;

  final double maxEarnPerDay;

  EstimateSleepResponse(this.todayEarn, this.maxEarnPerDay);

  factory EstimateSleepResponse.fromJson(Map<String, dynamic> json) {
    return _$EstimateSleepResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EstimateSleepResponseToJson(this);
}
