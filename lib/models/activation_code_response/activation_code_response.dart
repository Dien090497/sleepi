import 'package:freezed_annotation/freezed_annotation.dart';

part 'activation_code_response.g.dart';

@JsonSerializable()
class ActivationCodeResponse {
  final String data;

  ActivationCodeResponse(this.data);

  factory ActivationCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$ActivationCodeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ActivationCodeResponseToJson(this);
}
