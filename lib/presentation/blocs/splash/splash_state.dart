import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/user/user_info_entity.dart';
import 'package:slee_fi/models/token_spending/token_spending.dart';

part 'splash_state.freezed.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.initial() = SplashInitial;

  const factory SplashState.done({
    required bool isSafeDevice,
    required UserInfoEntity? userInfoEntity,
    required List<TokenSpending> listTokens,
  }) = SplashDone;

  const factory SplashState.error(String msg) = SplashError;
}
