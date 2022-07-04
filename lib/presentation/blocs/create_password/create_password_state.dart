

import 'package:freezed_annotation/freezed_annotation.dart';
part 'create_password_state.freezed.dart';
@freezed
class CreatePasswordState with _$CreatePasswordState{
  const factory CreatePasswordState.initial() = CreatePasswordStateInit;

  const factory CreatePasswordState.process() = CreatePasswordStateProcess;

  const factory CreatePasswordState.errorConfirmPassword(String message) = CreatePasswordStateErrorConfirmPassword;

  const factory CreatePasswordState.errorPassword(String message) = CreatePasswordStateErrorPassword;

  const factory CreatePasswordState.errorCreate(String message) = CreatePasswordStateErrorCreate;

  const factory CreatePasswordState.success(bool isFirstOpenApp) = CreatePasswordStateSuccess;





}