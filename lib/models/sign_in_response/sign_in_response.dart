
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/models/user/user_info_model.dart';
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
  final UserInfoModel user;
  Content(this.accessToken, this.refreshToken, this.user);

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);

  Map<String, dynamic> toJson() => _$ContentToJson(this);

}