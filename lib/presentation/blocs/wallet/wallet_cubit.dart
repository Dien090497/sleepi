import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/usecase/usecase.dart';
import 'package:slee_fi/usecase/wallet/current_wallet_usecase.dart';
import 'package:slee_fi/usecase/wallet/first_open_wallet_session_usecase.dart';

import '../../../entities/wallet_info/wallet_info_entity.dart';
import 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  WalletCubit() : super(const WalletState.initial());

  final _firstOpenWalletUC = getIt<CheckFirstOpenWallet>();
  final _currentWalletUC = getIt<CurrentWalletUsecase>();
  var firstOpenWallet = true;

  init() async {
    emit(const WalletState.loading());
    var openWallet = await _firstOpenWalletUC.call(NoParams());
    final walletCall = await _currentWalletUC.call(NoParams());

    WalletInfoEntity? walletInfo;
    openWallet.foldRight(bool, (r, previous) => firstOpenWallet = r);
    walletCall.fold((l) => null, (r) => walletInfo = r);
    emit(WalletState.loaded(
        walletInfoEntity: walletInfo, firstOpenWallet: firstOpenWallet));
  }

  importWallet(WalletInfoEntity walletInfoEntity) {
    final currentState = state;
    if (currentState is WalletStateLoaded) {
      emit(currentState.copyWith(walletInfoEntity: walletInfoEntity));
    }else {
      emit( WalletState.loaded(walletInfoEntity: walletInfoEntity, firstOpenWallet: firstOpenWallet));
    }
  }
}
