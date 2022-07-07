import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/token/token_entity.dart';
import 'package:slee_fi/entities/user/user_info_entity.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.initial() = UserInitial;

  const factory UserState.loaded(
    UserInfoEntity userInfoEntity,
    List<TokenEntity> listTokens, {
    @Default(false) bool loading,
  }) = UserLoaded;

  const factory UserState.error(String msg) = UserError;
}
