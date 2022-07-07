import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/presentation/blocs/global_wallet/global_wallet_state.dart';
import 'package:slee_fi/usecase/current_user_usecase.dart';
import 'package:slee_fi/usecase/fetch_balance_spending_usecase.dart';
import 'package:slee_fi/usecase/usecase.dart';

class GlobalWalletCubit extends Cubit<GlobalWalletState> {
  GlobalWalletCubit() : super(const GlobalWalletState.initial());
  // final _currentWalletUC = getIt<CurrentWalletUseCase>();
  final _fetchBalanceSpendingUC = getIt<FetchBalanceSpendingUseCase>();
  final _currentUserUseCase = getIt<CurrentUserUseCase>();

  String uid = '';

  init() async {
    emit(const GlobalWalletState.loading());
    'start call '.log;
    var userUC = await _currentUserUseCase.call(NoParams());
    userUC.fold((l) {
      'load current user  failed $l'.log;
    }, (r) {
      uid = '2';
      'load current user  success '.log;

      _fetch();
    });
  }

  _fetch() async {
    var balanceUC = await _fetchBalanceSpendingUC.call('2');
    balanceUC.fold((l) {
      'on balance failed $l'.log;
    }, (r) {
      'on balance success $r'.log;
    });
  }
}
