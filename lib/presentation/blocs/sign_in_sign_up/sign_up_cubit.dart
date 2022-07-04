import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/models/sign_up_schema/sign_up_schema.dart';
import 'package:slee_fi/presentation/blocs/sign_in_sign_up/sign_up_state.dart';
import 'package:slee_fi/schema/sign_in_schema/sign_in_schema.dart';
import 'package:slee_fi/usecase/is_first_open_app_usecase.dart';
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
  final _isFirstOpenApp = getIt<IsFirstOpenAppUseCase>();

  final _saveUserUC = getIt<SaveUserLocalUseCase>();

  final fetchSettingActiveCode = getIt<SettingActiveCodeUseCase>();
  String email = '';
  String password = '';
  String otp = '';
  bool isFistOpenApp = false;

  init() async {
    emit(const SignInSignUpState.initial());
    var result = await _isFirstOpenApp.call(NoParams());
    result.fold((l) => null, (r) => isFistOpenApp = r);
  }

  senOtp() async {
    if (!validateEmail()) {
      return;
    }
    emit(const SignInSignUpState.process());

    var result =
        await _sendOtpUC.call(SendOTPParam(email.trim(), OTPType.signUp));
    result.fold(
      (l) => emit(SignInSignUpState.errorEmail(l.msg)),
      (r) => emit(const SignInSignUpState.initial()),
    );
  }

  _signUp() async {
    var result =
        await _signUpUseCase.call(SignUpSchema(int.parse(otp), email.trim()));
    result.fold((l) => emit(SignInSignUpState.error(l.msg)),
        (userResponse) async {
      var setting = await fetchSettingActiveCode.call(NoParams());
      setting.fold(
        (l) => emit(SignInSignUpState.error(l.msg)),
        (r) => emit(SignInSignUpState.signUpSuccess(
            r.data.isEnable, userResponse.data)),
      );
    });
  }

  signIn() async {
    if (!validateEmail() || !_validatePassword()) {
      return;
    }
    emit(const SignInSignUpState.process());
    var result = await _logInUseCase.call(SignInSchema(email.trim(), password));

    result.fold((l) => emit(SignInSignUpState.error(l.msg)), (r) async {
      await _saveUserUC.call(r.data.user);
      emit(SignInSignUpState.signInSuccess(isFistOpenApp));
    });
  }

  signUp() {
    if (!validateEmail() || validateOTP()) {
      return;
    }

    emit(const SignInSignUpState.process());
    _signUp();
  }

  bool _validatePassword() {
    var message = password.validatePassword;

    if (message.isNotEmpty) {
      emit(SignInSignUpState.error(message));
      return false;
    }
    return true;
  }

  bool validateOTP() {
    var message = otp.validateOTP;
    if (message.isNotEmpty) {
      emit(SignInSignUpState.error(message));
    }
    'message is $message'.log;
    return message.isNotEmpty;
  }

  bool validateEmail() {
    var message = email.validateEmail;

    if (message.isNotEmpty) {
      emit(SignInSignUpState.errorEmail(message));
      return false;
    }
    return true;
  }
}
