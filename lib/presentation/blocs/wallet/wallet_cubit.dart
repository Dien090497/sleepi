import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/presentation/blocs/wallet/wallet_state.dart';

import '../../../datasources/remote/network/web3_datasource.dart';
import '../../../usecase/wallet_usecase.dart';

class WalletCubit extends Cubit<WalletState> {
  late final Web3DataSource web3dataSource;

  WalletCubit() : super(const WalletState.initial()) {
    web3dataSource = getIt<Web3DataSource>();
  }

  init() async {
    var balance = await WalletUseCase().call(params: null);
    balance.foldRight(int, (r, previous) {
      log(' on right is  $r');
    });
  }
}
