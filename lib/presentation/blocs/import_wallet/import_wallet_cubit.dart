import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/utils/random_utils.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/usecase/wallet/import_wallet_usecase.dart';

import 'import_wallet_state.dart';

class ImportWalletCubit extends Cubit<ImportWalletState> {
  ImportWalletCubit() : super(const ImportWalletState.initial());

  final randomUtils = getIt<RandomUtils>();
  final importWalletUC = getIt<ImportWalletUseCase>();

  String otp = '';
  String mnemonic = '';
  String remoteOtp = '';

  Future importWallet() async {
    if (otp.isEmpty) {
      emit(const ImportWalletState.errorOtp('Verification Code required'));
      return;
    }
    if (mnemonic.isEmpty) {
      emit(ImportWalletState.errorMnemonic(
          LocaleKeys.leave_seed_phrase_blank.tr()));
      return;
    }

    emit(const ImportWalletState.initial());
    final currentState = state;
    //todo: uncomment code
    // if (currentState is ImportWalletInitial && remoteOtp != otp) {
    //   emit(const ImportWalletState.errorOtp('Incorrect Code'));
    //   return;
    // }

    if (currentState is ImportWalletInitial) {
      emit(currentState.copyWith(isLoading: true));
      var result = await importWalletUC.call(mnemonic);
      result.fold((l) {
        emit(ImportWalletState.errorMnemonic(
            LocaleKeys.input_incorrect_seed_phrase.tr()));
      }, (r) {
        emit(ImportWalletState.success(r));
      });
    }
  }

  sendOtp() {
    remoteOtp = randomUtils.randomOTPCode();
  }
}
