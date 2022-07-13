import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/schema/verify_schema/verify_schema.dart';
import 'package:slee_fi/usecase/current_user_usecase.dart';
import 'package:slee_fi/usecase/fetch_balance_spending_usecase.dart';
import 'package:slee_fi/usecase/get_user_usecase.dart';
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
  final _getUserUC = getIt<GetUserUseCase>();
  final _fetchBalanceSpendingUC = getIt<FetchBalanceSpendingUseCase>();

  late String userEmail;

  init() {
    _getUserEmail();
  }

  Future<void> process({required String otp, required String mnemonic}) async {
    emit(const ImportWalletState.initial());
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
        emit(const ImportWalletState.initial(isLoading: true));
        result.fold(
          (l) {
            emit(ImportWalletState.errorMnemonic('$l'));
          },
          (r) {
            if (!r) {
              emit(ImportWalletState.errorMnemonic(
                  LocaleKeys.invalid_mnemonic_please_try_again.tr()));
            } else {
              emit(const ImportWalletState.verifyOtpSuccess());
            }
          },
        );
      },
    );
  }

  sendOtp() async {
    final result =
        await sendOtpUC.call(SendOTPParam(userEmail, OTPType.importWallet));
    result.fold((l) {
      emit(ImportWalletState.errorOtp('$l'));
    }, (r) {});
  }

  importWallet({required String mnemonic}) async {
    emit(const ImportWalletState.initial(isLoading: true));
    await Future.delayed(const Duration(milliseconds: 1000));
    final result = await importWalletUC.call(mnemonic);
    result.fold((l) {
      emit(ImportWalletState.errorMnemonic(
          LocaleKeys.invalid_mnemonic_please_try_again.tr()));
    }, (r) async {
      final userRes = await _getUserUC.call(NoParams());
      userRes.fold((l){
        emit(ImportWalletState.success(r, null, []));
      }, (userInfo) async {
        final balanceRes =
        await _fetchBalanceSpendingUC.call('${userInfo.id}');
        balanceRes.fold((l) {
          emit(ImportWalletState.success(r, userInfo, []));
        }, (tokensSpending) {
          emit(ImportWalletState.success(r, userInfo, tokensSpending));
        });
      });
    });
  }

  Future _getUserEmail() async {
    final result = await _currentUserUC.call(NoParams());
    result.fold((l) {
      'error get local email $l'.log;
    }, (r) {
      userEmail = r.email;
    });
  }
}
