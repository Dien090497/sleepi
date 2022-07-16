import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/presentation/blocs/splash/splash_state.dart';
import 'package:slee_fi/usecase/fetch_balance_spending_usecase.dart';
import 'package:slee_fi/usecase/get_global_config.dart';
import 'package:slee_fi/usecase/get_user_status_tracking_usecase.dart';
import 'package:slee_fi/usecase/get_user_usecase.dart';
import 'package:slee_fi/usecase/usecase.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState.initial());

  final _getGlobalConfigUseCase = getIt<GetGlobalConfigUseCase>();
  final _getUserUC = getIt<GetUserUseCase>();
  final _fetchBalanceSpendingUC = getIt<FetchBalanceSpendingUseCase>();
  final _getUserStatusTrackingUC = getIt<GetUserStatusTrackingUseCase>();

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
            userStatusTrackingModel: null,
          ));
        },
        (userInfo) async {
          final balanceRes =
              await _fetchBalanceSpendingUC.call('${userInfo.id}');
          balanceRes.fold((l) {
            emit(SplashState.error('$l'));
          }, (tokensSpending) async {
            final tracking = await _getUserStatusTrackingUC.call(NoParams());
            tracking.fold((l) {
              emit(SplashState.error('$l'));
            }, (r) {
              emit(SplashState.done(
                isSafeDevice: kDebugMode ? true : true,
                userInfoEntity: userInfo,
                listTokens: tokensSpending,
                userStatusTrackingModel: r
              ));
            });
          });
        },
      );
    });
  }
}
