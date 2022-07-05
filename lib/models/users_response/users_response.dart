import 'package:json_annotation/json_annotation.dart';
import 'package:slee_fi/models/user/user_info_model.dart';

part 'users_response.g.dart';

@JsonSerializable()
class UsersResponse {
  final Object meta;
  final List<UserInfoModel> data;

  factory UsersResponse.fromJson(Map<String, dynamic> json) =>
      _$UsersResponseFromJson(json);

  UsersResponse(this.meta, this.data);

  Map<String, dynamic> toJson() => _$UsersResponseToJson(this);
}
