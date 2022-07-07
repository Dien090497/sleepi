import 'package:json_annotation/json_annotation.dart';

part 'global_config_response.g.dart';
@JsonSerializable()
class GlobalConfigResponse {
  final String contract;
  final bool isEnableActiveCode;
  @JsonKey(name: 'message_sign')
  final String messageSign;

  GlobalConfigResponse({required this.contract, required this.isEnableActiveCode, required this.messageSign});
  factory GlobalConfigResponse.fromJson(Map<String, dynamic> json) => _$GlobalConfigResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GlobalConfigResponseToJson(this);
}
