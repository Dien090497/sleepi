import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info_entity.freezed.dart';

@freezed
class UserInfoEntity with _$UserInfoEntity {
  const factory UserInfoEntity({
    required int id,
    required String? name,
    required String? username,
    required List<String> roles,
    required String email,
    required bool isAccountDisabled,
    required String createdAt,
    required String updatedAt,
    String? wallet,
  }) = _UserInfoEntity;
}
