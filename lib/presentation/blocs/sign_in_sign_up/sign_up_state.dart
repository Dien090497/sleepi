import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/user/user_info_entity.dart';
import 'package:slee_fi/models/token_spending/token_spending.dart';
import 'package:slee_fi/models/user_status_tracking_model/user_status_tracking_model.dart';

part 'sign_up_state.freezed.dart';

@freezed
class SignInSignUpState with _$SignInSignUpState {
  const factory SignInSignUpState.initial() = SignInSignUpStateInit;

  const factory SignInSignUpState.process() = SignInSignUpStateProcess;

  const factory SignInSignUpState.error(String message) =
      SignInSignUpStateError;

  const factory SignInSignUpState.errorEmail(String message) =
      SignInSignUpStateErrorEmail;

  const factory SignInSignUpState.signUpSuccess(
    bool enableActiveCode,
    UserInfoEntity userInfoEntity,
    List<TokenSpending> listToken,
  ) = SignInSignUpStateSignUpSuccess;

  const factory SignInSignUpState.signInSuccess(
    bool isFirstOpenApp,
    UserInfoEntity userInfoEntity,
    List<TokenSpending> listToken,
    UserStatusTrackingModel userStatusTrackingModel,
  ) = SignInSignUpStateSignInSuccess;

  const factory SignInSignUpState.verifyOTPSuccess(int otp, String email) =
      SignInSignUpStateVerifySuccess;
}
