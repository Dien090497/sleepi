
import 'package:freezed_annotation/freezed_annotation.dart';
part 'sign_in_response.g.dart';
@JsonSerializable()
class SignInResponse {
  final Content data;

  SignInResponse(this.data);

  factory SignInResponse.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignInResponseToJson(this);
}
@JsonSerializable()
class Content {
  final String accessToken;
  final String refreshToken;

  Content(this.accessToken, this.refreshToken);

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);

  Map<String, dynamic> toJson() => _$ContentToJson(this);

}