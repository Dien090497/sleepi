import 'package:json_annotation/json_annotation.dart';

part 'create_password_response.g.dart';

@JsonSerializable()
class CreatePasswordResponse {
  final dynamic meta;
  final Content data;

  CreatePasswordResponse(this.meta, this.data);

  factory CreatePasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$CreatePasswordResponseFromJson(json);


  Map<String, dynamic> toJson() => _$CreatePasswordResponseToJson(this);
}

@JsonSerializable()
class Content {
  final String email;
  final dynamic wallet;
  final List<String> roles;

  Content(this.email, this.wallet, this.roles);

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);

  Map<String, dynamic> toJson() => _$ContentToJson(this);

}
