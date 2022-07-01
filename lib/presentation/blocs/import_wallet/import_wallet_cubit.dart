import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/utils/random_utils.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/verify_schema/verify_schema.dart';
import 'package:slee_fi/usecase/send_otp_mail_usecase.dart';
import 'package:slee_fi/usecase/verify_otp_usecase.dart';
import 'package:slee_fi/usecase/wallet/import_wallet_usecase.dart';
import 'import_wallet_state.dart';

class ImportWalletCubit extends Cubit<ImportWalletState> {
  ImportWalletCubit() : super(const ImportWalletState.initial());

  final randomUtils = getIt<RandomUtils>();
  final importWalletUC = getIt<ImportWalletUseCase>();
  final sendOtpUC = getIt<SendOTPMailUseCase>();
  final verifyOtpUC = getIt<VerifyOTPUseCase>();
  String userEmail = 'duong.nguyen3@sotatek.com';
  String otp = '';
  String mnemonic = '';

  Future process() async {
    if (otp.isEmpty) {
      emit(const ImportWalletState.errorOtp('Verification Code required'));
      return;
    }
    if (mnemonic.isEmpty) {
      emit(const ImportWalletState.errorMnemonic('Please Enter Seed Phrase'));
      return;
    }

    verifyOtp();
  }

  sendOtp() async {
    var result =
        await sendOtpUC.call(SendOTPParam(userEmail, OTPType.addWallet));
    result.fold((l) {
      "send email error  ${l.msg}".log;
      emit(ImportWalletState.errorOtp(l.msg));
    }, (r) {
      'send email success '.log;
    });
    // var auth =  getIt<AuthDataSource>();
    // var result = await auth.sendOTP('duong.nguyen3@sotatek.com', OTPType.importWallet);
    // 'result send otp is  ${result.runtimeType}   $result'.log;
    // remoteOtp = randomUtils.randomOTPCode();
  }

  verifyOtp() async {
    emit(const ImportWalletState.initial());

    var result = await verifyOtpUC
        .call(VerifySchema(int.parse(otp), userEmail, OTPType.importWallet));

    result.fold((l) {
      emit(ImportWalletState.errorOtp(l.msg));
    }, (r) => _importWallet());
  }

  _importWallet() async {
    final currentState = state;
    if (currentState is ImportWalletInitial) {
      emit(currentState.copyWith(isLoading: true));
      var result = await importWalletUC.call(mnemonic);
      result.fold((l) {
        emit(ImportWalletState.errorMnemonic(
            l is FailureMessage ? l.msg : '$l'));
      }, (r) {
        emit(ImportWalletState.success(r));
      });
    }
  }
}
