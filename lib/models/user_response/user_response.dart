import 'package:json_annotation/json_annotation.dart';
import 'package:slee_fi/models/user/user_info_model.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  final Object meta;
  final UserInfoModel data;

  const UserResponse(this.meta, this.data);

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}
