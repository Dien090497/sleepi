import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/presentation/blocs/wallet/wallet_state.dart';
import 'package:slee_fi/usecase/usecase.dart';
import 'package:slee_fi/usecase/wallet/current_wallet_usecase.dart';

import '../../../di/injector.dart';
import '../../../failures/failure.dart';

class WalletCubit extends Cubit<WalletState> {
  WalletCubit() : super(const WalletState.initial());
  final _currentWalletUC = getIt<CurrentWalletUsecase>();

  loadCurrentWallet() async {
    emit(const WalletState.loading());
    final result = await _currentWalletUC.call(NoParams());

    result.fold((l) {
      emit(const WalletState.empty());
      log('WalletCubit on failed   ${l is FailureMessage ? l.msg : '$l'} ');
    }, (r) {
      log('WalletCubit on success ');

      emit(WalletState.success(walletInfoEntity: r));
    });
  }


}
