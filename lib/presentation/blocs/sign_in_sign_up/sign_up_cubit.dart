import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/models/sign_in_schema/sign_in_schema.dart';
import 'package:slee_fi/models/sign_up_schema/sign_up_schema.dart';
import 'package:slee_fi/presentation/blocs/sign_in_sign_up/sign_up_state.dart';
import 'package:slee_fi/usecase/login_usecase.dart';
import 'package:slee_fi/usecase/save_user_local_usecase.dart';
import 'package:slee_fi/usecase/send_otp_mail_usecase.dart';
import 'package:slee_fi/usecase/setting_active_code_usecase.dart';
import 'package:slee_fi/usecase/sign_up_usecase.dart';
import 'package:slee_fi/usecase/usecase.dart';

class SigInSignUpCubit extends Cubit<SignInSignUpState> {
  SigInSignUpCubit() : super(const SignInSignUpState.initial());

  final SendOTPMailUseCase _sendOtpUC = getIt<SendOTPMailUseCase>();
  final SignUpUseCase _signUpUseCase = getIt<SignUpUseCase>();
  final LogInUseCase _logInUseCase = getIt<LogInUseCase>();

  final _saveUserUC = getIt<SaveUserLocalUseCase>();

  final fetchSettingActiveCode = getIt<SettingActiveCodeUseCase>();
  String email = '';
  String password = '';
  String otp = '';

  init() {
    emit(const SignInSignUpState.initial());
  }

  senOtp() async {
    if (!_validateEmail()) {
      return;
    }
    emit(const SignInSignUpState.process());

    var result =
        await _sendOtpUC.call(SendOTPParam(email.trim(), OTPType.signUp));
    result.fold(
      (l) => emit(SignInSignUpState.error(l.msg)),
      (r) => emit(const SignInSignUpState.initial()),
    );
  }

  _signUp() async {
    var result =
        await _signUpUseCase.call(SignUpSchema(int.parse(otp), email.trim()));
    result.fold((l) => emit(SignInSignUpState.error(l.msg)),
        (userResponse) async {
      var setting = await fetchSettingActiveCode.call(NoParams());
      setting.fold((l) => emit(SignInSignUpState.error(l.msg)),
          (r) => emit(SignInSignUpState.signUpSuccess(userResponse.data)));
    });
  }

  signIn() async {
    if (!_validateEmail() || !_validatePassword()) {
      return;
    }
    emit(const SignInSignUpState.process());
    var result = await _logInUseCase.call(SignInSchema(email.trim(), password));

    result.fold((l) => emit(SignInSignUpState.error(l.msg)), (r) async {
      await _saveUserUC.call(r.data.user);
      emit(const SignInSignUpState.signInSuccess());
    });
  }

  signUp() {
    if (!_validateEmail()) {
      return;
    }

    if (otp.isEmpty || otp.length < 6) {
      emit(const SignInSignUpState.error('Verification Code required'));
      return;
    }
    emit(const SignInSignUpState.process());
    _signUp();
  }

  bool _validatePassword() {
    if (password.isEmpty) {
      emit(const SignInSignUpState.error('Password required'));
      return false;
    }

    return true;
  }

  bool _validateEmail() {
    if (email.isEmpty) {
      emit(SignInSignUpState.errorEmail(LocaleKeys.please_enter_email.tr()));
      return false;
    }
    return true;
  }
}
