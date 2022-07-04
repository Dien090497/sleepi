import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/models/user/user_info_model.dart';

part 'sign_up_state.freezed.dart';

@freezed
class SignInSignUpState with _$SignInSignUpState {
  const factory SignInSignUpState.initial() = SignInSignUpStateInit;

  const factory SignInSignUpState.process() = SignInSignUpStateProcess;

  const factory SignInSignUpState.error(String message) = SignInSignUpStateError;

  const factory SignInSignUpState.errorEmail(String message) = SignInSignUpStateErrorEmail;

  const factory SignInSignUpState.signUpSuccess(bool enableActiveCode , UserInfoModel userInfoModel) = SignInSignUpStateSignUpSuccess;

  const factory SignInSignUpState.signInSuccess(bool isFirstOpenApp) = SignInSignUpStateSignInSuccess;



}
