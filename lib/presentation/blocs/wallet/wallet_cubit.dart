import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/presentation/blocs/wallet/wallet_state.dart';
import 'package:slee_fi/usecase/usecase.dart';
import 'package:slee_fi/usecase/wallet/current_wallet_usecase.dart';

class WalletCubit extends Cubit<WalletState> {
  WalletCubit() : super(const WalletState.initial());
  final _currentWalletUC = getIt<CurrentWalletUsecase>();

  loadCurrentWallet() async {
    emit(const WalletState.loading());
    final result = await _currentWalletUC.call(NoParams());

    result.fold((l) {
      emit(const WalletState.empty());
    }, (r) {
      var balance = r.nativeCurrency.balance / pow(10, 18);
      if(balance == 0.0) balance = 0;
      emit(WalletState.success(walletInfoEntity: r, balance: balance));
    });
  }
}
