import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.initial() = SplashInitial;

  const factory SplashState.done({required bool isSafeDevice}) = SplashDone;

  const factory SplashState.error(String msg) = SplashError;
}
