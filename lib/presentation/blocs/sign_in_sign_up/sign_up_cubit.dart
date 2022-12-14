import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/utils/appsflyer_custom.dart';
import 'package:slee_fi/datasources/local/secure_storage.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/sign_in_sign_up/sign_up_state.dart';
import 'package:slee_fi/presentation/screens/login_signup/widgets/account_login_widget.dart';
import 'package:slee_fi/schema/sign_in_schema/sign_in_schema.dart';
import 'package:slee_fi/schema/sign_up_schema/sign_up_schema.dart';
import 'package:slee_fi/schema/verify_schema/verify_schema.dart';
import 'package:slee_fi/usecase/fetch_balance_spending_usecase.dart';
import 'package:slee_fi/usecase/get_user_status_tracking_usecase.dart';
import 'package:slee_fi/usecase/is_first_open_app_usecase.dart';
import 'package:slee_fi/usecase/login_usecase.dart';
import 'package:slee_fi/usecase/setting_active_code_usecase.dart';
import 'package:slee_fi/usecase/sign_up_usecase.dart';
import 'package:slee_fi/usecase/usecase.dart';
import 'package:slee_fi/usecase/verify_otp_usecase.dart';

class SigInSignUpCubit extends Cubit<SignInSignUpState> {
  SigInSignUpCubit() : super(const SignInSignUpState.initial());

  // final _sendOtpUC = getIt<SendOTPMailUseCase>();
  final _signUpUseCase = getIt<SignUpUseCase>();
  final _logInUseCase = getIt<LogInUseCase>();
  final _isFirstOpenAppUC = getIt<IsFirstOpenAppUseCase>();
  final _verifyOTPUC = getIt<VerifyOTPUseCase>();
  final _fetchSettingActiveCode = getIt<SettingActiveCodeUseCase>();
  final _fetchBalanceSpendingUC = getIt<FetchBalanceSpendingUseCase>();
  final _secureStorage = getIt<SecureStorage>();
  final _getUserStatusTrackingUC = getIt<GetUserStatusTrackingUseCase>();

  String email = '';
  String _password = '';
  String otp = '';

  init() async {
    emit(const SignInSignUpState.initial());
    _password = '';
    otp = '';
  }

  process(Action action) {
    getIt<AppFlyerCustom>().signIn();
    switch (action) {
      case Action.forgotPassword:
        _verifyOTP();
        break;
      case Action.signUp:
        signUp();
        break;
      case Action.signIn:
        _signIn();
        break;
    }
  }

  // senOtp(Action action) async {
  //   if (!validateEmail()) {
  //     return;
  //   }
  //   emit(const SignInSignUpState.process());
  //
  //   final type = action == Action.signUp ? OTPType.signUp : OTPType.changePass;
  //
  //   final result = await _sendOtpUC.call(SendOTPParam(email.trim(), type));
  //   result.fold(
  //     (l) => emit(SignInSignUpState.errorEmail('$l')),
  //     (r) => emit(const SignInSignUpState.initial()),
  //   );
  // }

  _signUp() async {
    final result =
        await _signUpUseCase.call(SignUpSchema(int.parse(otp), email.trim()));
    result.fold((l) => emit(SignInSignUpState.error('$l')),
        (userResponse) async {
      final setting = await _fetchSettingActiveCode.call(NoParams());
      await setting.fold(
        (l) async => emit(SignInSignUpState.error('$l')),
        (r) async {
          final balanceRes =
              await _fetchBalanceSpendingUC.call('${userResponse.id}');
          balanceRes.fold(
            (l) => emit(SignInSignUpState.error('$l')),
            (tokensSpending) {
              emit(SignInSignUpState.signUpSuccess(
                r.data.isEnable,
                userResponse,
                tokensSpending,
              ));
            },
          );
        },
      );
    });
  }

  _signIn() async {
    if (!validateEmail()) {
      return;
    }
    if (_password.isEmpty) {
      return emit(
          SignInSignUpState.error(LocaleKeys.this_field_is_required.tr()));
    }
    emit(const SignInSignUpState.process());
    final result =
        await _logInUseCase.call(SignInSchema(email.trim(), _password));

    await result.fold(
      (l) async => emit(SignInSignUpState.error('$l')),
      (r) async {
        await _saveEmailSuggestion(email);
        final balanceRes = await _fetchBalanceSpendingUC.call('${r.id}');
        balanceRes.fold(
          (l) => emit(SignInSignUpState.error('$l')),
          (tokensSpending) async {
            final tracking = await _getUserStatusTrackingUC.call(NoParams());
            tracking.fold((l) {
              emit(SignInSignUpState.error('$l'));
            }, (statusTracking) async {
              final firstOpen = await _isFirstOpenAppUC.call(email.trim());
              firstOpen.fold(
                  (l) => emit(SignInSignUpState.signInSuccess(
                      true, r, tokensSpending, statusTracking)),
                  (isFirstOpen) async {
                emit(SignInSignUpState.signInSuccess(
                    isFirstOpen, r, tokensSpending, statusTracking));
              });
            });
          },
        );
      },
    );
  }

  signUp() {
    if (!validateEmail() || _validateOTP()) {
      return;
    }

    emit(const SignInSignUpState.process());
    _signUp();
  }

  // bool _validatePassword() {
  //   final message = _password.validatePassword;
  //
  //   if (message.isNotEmpty) {
  //     emit(SignInSignUpState.error(message));
  //     return false;
  //   }
  //   return true;
  // }

  bool _validateOTP() {
    final message = otp.validateOTP;
    if (message.isNotEmpty) {
      emit(SignInSignUpState.error(message));
    }
    return message.isNotEmpty;
  }

  bool validateEmail() {
    final message = email.validateEmail;

    if (message.isNotEmpty) {
      emit(SignInSignUpState.errorEmail(message));
      return false;
    }
    return true;
  }

  void _verifyOTP() async {
    if (!validateEmail() || _validateOTP()) {
      return;
    }

    emit(const SignInSignUpState.process());
    int otp = int.parse(this.otp);
    final result = await _verifyOTPUC
        .call(VerifyOTPSchema(otp, email.trim(), OTPType.changePass));

    result.fold(
      (l) => emit(SignInSignUpState.error('$l')),
      (r) => emit(SignInSignUpState.verifyOTPSuccess(otp, email.trim())),
    );
  }

  onChangeOTP(String value) {
    if (state is SignInSignUpStateError && (value.isEmpty || otp.isEmpty)) {
      emit(const SignInSignUpState.initial());
    }
    otp = value;
  }

  onChangeEmail(String value) {
    if (state is SignInSignUpStateErrorEmail &&
        (value.isEmpty || email.isEmpty)) {
      emit(const SignInSignUpState.initial());
    }
    email = value.toLowerCase();
  }

  onPasswordChange(String value) {
    if ((value.isEmpty || _password.isEmpty) &&
        state is SignInSignUpStateError) {
      emit(const SignInSignUpState.initial());
    }
    _password = value;
  }

  Future<void> _saveEmailSuggestion(String email) async {
    _secureStorage.addEmailSuggestion(email);
    _secureStorage.saveLastUserSignIn(email);
  }

  void onSendOtpError(String message) {
    if (message.isEmpty) {
      emit(const SignInSignUpState.initial());
      return;
    }
    emit(SignInSignUpState.errorEmail(message));
  }
}
