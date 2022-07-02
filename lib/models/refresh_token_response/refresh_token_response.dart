
import 'package:json_annotation/json_annotation.dart';
part 'refresh_token_response.g.dart';
@JsonSerializable()
class RefreshTokenResponse{
  final dynamic meta;
  final RefreshTokenModel data;

  RefreshTokenResponse(this.meta, this.data);

  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) => _$RefreshTokenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshTokenResponseToJson(this);
}
@JsonSerializable()
class RefreshTokenModel{
  final String accessToken;
  final String refreshToken;

  RefreshTokenModel(this.accessToken, this.refreshToken);
  factory RefreshTokenModel.fromJson(Map<String, dynamic> json) => _$RefreshTokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshTokenModelToJson(this);


}