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

  late String otp;
  late String mnemonic;
  late String remoteOtp;


  Future<bool> importWallet() async {
    emit(const ImportWalletState.initial());
    final currentState = state;

    if (currentState is ImportWalletInitial && remoteOtp != otp) {
      emit(const ImportWalletState.errorOtp('Incorrect Code'));
      return false;
    }
    if (currentState is ImportWalletInitial) {
      emit(currentState.copyWith(isLoading: true));
      var result = await importWalletUC.call(mnemonic);
      result.fold(
          (l) => emit(ImportWalletState.errorMnemonic(
              l is FailureMessage ? l.msg : '$l')),
          (r) => emit(ImportWalletState.success(r)));
    }
    return false;
  }

  sendOtp() {
    remoteOtp = randomUtils.randomOTPCode();
  }
}
