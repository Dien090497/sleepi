import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/presentation/blocs/wallet/import_wallet_state.dart';

import '../../../common/utils/random_utils.dart';
import '../../../di/injector.dart';
import '../../../failures/failure.dart';
import '../../../usecase/import_wallet_usecase.dart';

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
      emit(const ImportWalletState.errorMnemonic('Please Enter Seed Phrase'));
      return;
    }

    emit(const ImportWalletState.initial());
    final currentState = state;

    if (currentState is ImportWalletInitial && remoteOtp != otp) {
      emit(const ImportWalletState.errorOtp('Incorrect Code'));
      return;
    }

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

  sendOtp() {
    remoteOtp = randomUtils.randomOTPCode();
  }
}
