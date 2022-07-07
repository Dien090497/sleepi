import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/entities/token/token_entity.dart';
import 'package:slee_fi/presentation/blocs/global_wallet/global_wallet_state.dart';
import 'package:slee_fi/resources/resources.dart';
import 'package:slee_fi/usecase/fetch_balance_spending_usecase.dart';

class GlobalWalletCubit extends Cubit<GlobalWalletState> {
  GlobalWalletCubit() : super(const GlobalWalletState.initial());

  // final _currentWalletUC = getIt<CurrentWalletUseCase>();
  final _fetchBalanceSpendingUC = getIt<FetchBalanceSpendingUseCase>();
  late final int uid;
  Timer? _timer;

  final _defaultTokens = [
    const TokenEntity(
        address: '',
        displayName: '',
        name: '',
        symbol: 'SLFT',
        icon: Ics.icSlft,
        balance: 0),
    const TokenEntity(
        address: '',
        displayName: '',
        name: '',
        symbol: 'SLGT',
        icon: Ics.icSlgt,
        balance: 0),
    const TokenEntity(
        address: '',
        displayName: '',
        name: '',
        symbol: 'AVAX',
        icon: Ics.icAvax,
        balance: 0),
  ];

  init(int uid) async {
    'init global wallet'.log;
    this.uid = uid;
    emit(GlobalWalletState.loaded(tokenList: _defaultTokens, loading: false));
    _fetch();
    final time = Timer.periodic(const Duration(seconds: 10), (timer) => _fetch());
    _timer = time;
  }

  //todo: logout and sign in again do not run to this function
  _fetch() async {
    'run to fetch '.log;
    var currentState = state;
    if (currentState is GlobalWalletStateLoaded) {
      emit(currentState.copyWith(
          loading: true, tokenList: currentState.tokenList));
    }
    var balanceUC = await _fetchBalanceSpendingUC.call('$uid');

    balanceUC.fold((l) {
      'on load balance error '.log;
    }, (r) {
      if (r.isNotEmpty) {
        final list = r
            .map((e) {
              return TokenEntity(
                  address: e.tokenAddress,
                  displayName: e.symbol,
                  name: e.symbol,
                  symbol: e.symbol,
                  icon: _catchIcon(e.symbol),
                  balance: double.parse(e.amount));
            })
            .toList()
            .reversed;
        emit(
            GlobalWalletState.loaded(tokenList: list.toList(), loading: false));
      }
    });
  }

  String _catchIcon(String symbol) {
    if (symbol == 'slgt') return Ics.icSlgt;
    if (symbol == 'slft') return Ics.icSlft;
    return Ics.icAvax;
  }

  cancelInterval() {
    _timer?.cancel();
    _timer = null;
    'timer í null ${_timer == null}'.log;
  }
}
