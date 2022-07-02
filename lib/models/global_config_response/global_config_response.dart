import 'package:json_annotation/json_annotation.dart';

part 'global_config_response.g.dart';
@JsonSerializable()
class GlobalConfigResponse {
  final String contract;

  GlobalConfigResponse(this.contract);
  factory GlobalConfigResponse.fromJson(Map<String, dynamic> json) => _$GlobalConfigResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GlobalConfigResponseToJson(this);
}
