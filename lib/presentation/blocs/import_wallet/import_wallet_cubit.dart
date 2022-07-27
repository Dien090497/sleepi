import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/schema/verify_schema/verify_schema.dart';
import 'package:slee_fi/usecase/current_user_usecase.dart';
import 'package:slee_fi/usecase/send_otp_mail_usecase.dart';
import 'package:slee_fi/usecase/usecase.dart';
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
  final _currentUserUC = getIt<CurrentUserUseCase>();

  String userEmail = '';

  void init() async {
    final result = await _currentUserUC.call(NoParams());
    result.fold((l) {}, (r) {
      userEmail = r.email;
    });
  }

  Future<void> process({required String otp, required String mnemonic}) async {
    emit(const ImportWalletState.initial(isLoading: true));
    if (otp.isEmpty) {
      emit(ImportWalletState.errorOtp(LocaleKeys.this_field_is_required.tr()));
      return;
    }
    if (mnemonic.isEmpty) {
      emit(ImportWalletState.errorMnemonic(
          LocaleKeys.this_field_is_required.tr()));
      return;
    }
    final result = await verifyOtpUC
        .call(VerifyOTPSchema(int.parse(otp), userEmail, OTPType.importWallet));
    result.fold(
      (l) {
        emit(ImportWalletState.errorOtp('$l'));
      },
      (r) async {
        final result = await _validateMnemonicUC.call(mnemonic);
        result.fold(
          (l) {
            emit(ImportWalletState.errorMnemonic('$l'));
          },
          (r) {
            if (!r) {
              emit(ImportWalletState.errorMnemonic(
                  LocaleKeys.invalid_mnemonic_please_try_again.tr()));
            } else {
              emit(ImportWalletState.verifyOtpSuccess(mnemonic));
            }
          },
        );
      },
    );
  }

  void sendOtp() async {
    final result =
        await sendOtpUC.call(SendOTPParam(userEmail, OTPType.importWallet));
    result.fold((l) {
      emit(ImportWalletState.errorOtp('$l'));
    }, (r) {});
  }
}
