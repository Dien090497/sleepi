import 'package:json_annotation/json_annotation.dart';
import 'package:slee_fi/entities/user/user_info_entity.dart';

part 'user_info_model.g.dart';

@JsonSerializable()
class UserInfoModel {
  final int id;
  final String? name;
  final String? username;
  final List<String> roles;
  final String email;
  final bool isAccountDisabled;
  final String createdAt;
  final String updatedAt;
  final String? wallet;

  factory UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelFromJson(json);

  const UserInfoModel(this.id, this.name, this.username, this.roles, this.email,
      this.isAccountDisabled, this.createdAt, this.updatedAt, this.wallet);

  Map<String, dynamic> toJson() => _$UserInfoModelToJson(this);

  UserInfoEntity toEntity() => UserInfoEntity(
        id: id,
        name: name,
        username: username,
        roles: roles,
        email: email,
        isAccountDisabled: isAccountDisabled,
        createdAt: createdAt,
        updatedAt: updatedAt,
        wallet: wallet
      );
}
