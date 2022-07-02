import 'package:json_annotation/json_annotation.dart';

part 'setting_active_code_response.g.dart';

@JsonSerializable()
class SettingActiveCodeResponse {
  final Content data;

  SettingActiveCodeResponse(this.data);

  factory SettingActiveCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$SettingActiveCodeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SettingActiveCodeResponseToJson(this);
}

@JsonSerializable()
class Content {
  final bool isEnable;

  Content(this.isEnable);

  factory Content.fromJson(Map<String, dynamic> json) => _$ContentFromJson(json);

  Map<String, dynamic> toJson() => _$ContentToJson(this);
}
