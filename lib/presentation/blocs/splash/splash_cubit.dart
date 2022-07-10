import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/presentation/blocs/splash/splash_state.dart';
import 'package:slee_fi/usecase/fetch_balance_spending_usecase.dart';
import 'package:slee_fi/usecase/get_global_config.dart';
import 'package:slee_fi/usecase/get_user_usecase.dart';
import 'package:slee_fi/usecase/usecase.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState.initial());

  final _getGlobalConfigUseCase = getIt<GetGlobalConfigUseCase>();
  final _getUserUC = getIt<GetUserUseCase>();
  final _fetchBalanceSpendingUC = getIt<FetchBalanceSpendingUseCase>();

  void init() async {
    // await Permission.location.request();
    //final isSafeDevice = await SafeDevice.isSafeDevice;
    final result = await _getGlobalConfigUseCase.call(NoParams());
    await result.fold((l) async {
      emit(SplashState.error('$l'));
    }, (r) async {
      final userRes = await _getUserUC.call(NoParams());
      await userRes.fold(
        (l) async {
          emit(const SplashState.done(
            isSafeDevice: kDebugMode ? true : true,
            userInfoEntity: null,
            listTokens: [],
          ));
        },
        (userInfo) async {
          final balanceRes =
              await _fetchBalanceSpendingUC.call('${userInfo.id}');
          balanceRes.fold((l) {
            emit(SplashState.error('$l'));
          }, (tokensSpending) {
            emit(SplashState.done(
              isSafeDevice: kDebugMode ? true : true,
              userInfoEntity: userInfo,
              listTokens: tokensSpending,
            ));
          });
        },
      );
    });
  }
}
