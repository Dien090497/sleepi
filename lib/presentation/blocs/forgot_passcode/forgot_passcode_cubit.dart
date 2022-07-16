import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/schema/verify_schema/verify_schema.dart';
import 'package:slee_fi/usecase/current_user_usecase.dart';
import 'package:slee_fi/usecase/send_otp_mail_usecase.dart';
import 'package:slee_fi/usecase/usecase.dart';
import 'package:slee_fi/usecase/verify_otp_usecase.dart';

import 'forgot_passcode_state.dart';

class ForgotPasscodeCubit extends Cubit<ForgotPasscodeState> {
  ForgotPasscodeCubit() : super(const ForgotPasscodeState.initial());

  final _sendOTPUC = getIt<SendOTPMailUseCase>();
  final _verifyOTPUC = getIt<VerifyOTPUseCase>();
  final _currentUserUC = getIt<CurrentUserUseCase>();

  String _email = '';
  String otp = '';

  bool verifySuccess = false;

  init() async {
    final result = await _currentUserUC.call(NoParams());
    result.fold((l) => null, (r) => _email = r.email);
  }

  void sendOTP() async {
    emit(const ForgotPasscodeState.process());
    final result =
        await _sendOTPUC.call(SendOTPParam(_email, OTPType.changePass));
    result.fold(
      (l) => emit(ForgotPasscodeState.error('$l')),
      (r) => emit(const ForgotPasscodeState.initial()),
    );
  }

  verifyOtp() async {
    if (_validateOTP()) {
      return;
    }
    if (verifySuccess) {
      emit(const ForgotPasscodeState.success());
      return;
    }
    emit(const ForgotPasscodeState.process());
    int otp = int.parse(this.otp);
    final result = await _verifyOTPUC
        .call(VerifyOTPSchema(otp, _email, OTPType.changePass));

    result.fold(
      (l) => emit(ForgotPasscodeState.error('$l')),
      (r) {
        emit(const ForgotPasscodeState.success());
        verifySuccess = true;
      },
    );
  }

  bool _validateOTP() {
    final message = otp.validateOTP;
    if (message.isNotEmpty) {
      emit(ForgotPasscodeState.error(message));
    }
    return message.isNotEmpty;
  }

  bool checkExistsEmail() {
    return _email.isNotEmpty;
  }
}
