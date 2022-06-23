import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/presentation/blocs/detail_wallet/detail_wallet_state.dart';
import 'package:slee_fi/usecase/usecase.dart';
import 'package:slee_fi/usecase/wallet/current_wallet_usecase.dart';

class DetailWalletCubit extends Cubit<DetailWalletState> {
  DetailWalletCubit() : super(const DetailWalletState.initial());
  final _currentWalletUC = getIt<CurrentWalletUsecase>();

  loadCurrentWallet() async {
    emit(const DetailWalletState.loading());
    final result = await _currentWalletUC.call(NoParams());

    result.fold((l) {
      emit(const DetailWalletState.empty());
    }, (r) {
      var balance = r.nativeCurrency.balance / pow(10, 18);
      emit(DetailWalletState.success(walletInfoEntity: r, balance: balance));
    });
  }
}
