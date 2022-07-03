import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/models/verify_schema/verify_schema.dart';
import 'package:slee_fi/usecase/send_otp_mail_usecase.dart';
import 'package:slee_fi/usecase/validate_mnemonic.dart';
import 'package:slee_fi/usecase/verify_otp_usecase.dart';
import 'package:slee_fi/usecase/wallet/import_wallet_usecase.dart';

import 'import_wallet_state.dart';

class ImportWalletCubit extends Cubit<ImportWalletState> {
  ImportWalletCubit() : super(const ImportWalletState.initial());

  final importWalletUC = getIt<ImportWalletUseCase>();
  final sendOtpUC = getIt<SendOTPMailUseCase>();
  final verifyOtpUC = getIt<VerifyOTPUseCase>();
  final _validateMnemonicUC = getIt<ValidateMnemonicUseCase>();
  late String userEmail;

  //todo: remove value
  bool? verifyOtpSuccess = kReleaseMode;

  String otp = '';
  String mnemonic = '';

  init() {
    userEmail = _getUserEmail;
  }

  Future process() async {
    emit(const ImportWalletState.initial());
    if (otp.isEmpty) {
      emit(const ImportWalletState.errorOtp('Verification Code required'));
      return;
    }
    if (mnemonic.isEmpty) {
      emit(ImportWalletState.errorMnemonic(
          LocaleKeys.this_field_is_required.tr()));
      return;
    }
    _validateMnemonicUC.call(mnemonic).fold(
        (l) => emit(ImportWalletState.errorMnemonic(
            LocaleKeys.invalid_mnemonic_please_try_again.tr())), (r) {
      if (!r) {
        emit(ImportWalletState.errorMnemonic(
            LocaleKeys.invalid_mnemonic_please_try_again.tr()));
      } else {
        verifyOtp();
      }
    });
  }

  sendOtp() async {
    var result =
        await sendOtpUC.call(SendOTPParam(userEmail, OTPType.importWallet));
    result.fold((l) {
      emit(ImportWalletState.errorOtp(l.msg));
    }, (r) {});
  }

  verifyOtp() async {
    'run to verify otp'.log;
    if (verifyOtpSuccess == true) {
      emit(const ImportWalletState.verifyOtpSuccess());
      return;
    }

    emit(const ImportWalletState.initial(isLoading: true));
    var result = await verifyOtpUC
        .call(VerifyOTPSchema(int.parse(otp), userEmail, OTPType.importWallet));

    result.fold((l) {
      emit(ImportWalletState.errorOtp(l.msg));
    }, (r) {
      verifyOtpSuccess = true;
      emit(const ImportWalletState.verifyOtpSuccess());
    });
  }

  importWallet() async {
    emit(const ImportWalletState.initial(isLoading: true));
    await Future.delayed(const Duration(milliseconds: 1000));
    var result = await importWalletUC.call(mnemonic);
    result.fold((l) {
      emit(ImportWalletState.errorMnemonic(
          LocaleKeys.invalid_mnemonic_please_try_again.tr()));
    }, (r) {
      emit(ImportWalletState.success(r));
    });
  }

  String get _getUserEmail {
    return 'duong.nguyen3@sotatek.com';
  }
}
