import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/schema/gacha/gacha_spin_schema.dart';
import 'package:slee_fi/usecase/gacha_get_common_usecase.dart';
import 'package:slee_fi/usecase/gacha_get_special_usecase.dart';
import 'package:slee_fi/usecase/gacha_history_usecase.dart';
import 'package:slee_fi/usecase/gacha_probability_config_usecase.dart';
import 'package:slee_fi/usecase/gacha_spin_usecase.dart';
import 'package:slee_fi/usecase/get_network_connection_usecase.dart';
import 'package:slee_fi/usecase/usecase.dart';

import 'gacha_spin_state.dart';

class GachaSpinCubit extends Cubit<GachaSpinState> {
  GachaSpinCubit(): super(const GachaSpinState.initial());

  final _gachaSpinUC = getIt<GachaSpinUseCase>();
  final _gachaProbabilityUC = getIt<GachaProbabilityConfigUseCase>();
  final _gachaHistoryUC = getIt<GachaHistoryUseCase>();
  final _gachaGetCommonUC = getIt<GachaGetCommonUseCase>();
  final _gachaGetSpecialUC = getIt<GachaGetSpecialUseCase>();

  void init() async {
    emit(const GachaSpinState.dataLoading());
    gachaProbabilityConfig();
    final result = await _gachaHistoryUC.call(NoParams());
    result.fold((l) {
      emit(GachaSpinState.fail('$l'));
    }, (success) {
      emit(GachaSpinState.gachaHistorySuccess(success));
    });
  }

  Future<void> gachaSpin(GachaSpinSchema params) async {
    emit(const GachaSpinState.loading());
    final checkConnection = getIt<GetNetworkConnectionUseCase>();
    final checkConnectionResult = await checkConnection.call(NoParams());
    checkConnectionResult.fold(
            (l) => debugPrint("$l"),
            (r) async{
          if(r != ConnectivityResult.mobile && r != ConnectivityResult.wifi)  {
            emit(const GachaSpinState.checkConnection());
          }else{
            final result = await _gachaSpinUC.call(params);
            result.fold(
                  (l) {
                emit(GachaSpinState.fail('$l'));
              },
                  (success) {
                emit( GachaSpinState.success(success));
              },
            );
          }
        });
  }

  Future<void> gachaProbabilityConfig() async {
    final result = await _gachaProbabilityUC.call(NoParams());
    result.fold((l) {
      emit(GachaSpinState.fail('$l'));
    }, (success) {
      emit(GachaSpinState.probabilityConfigSuccess(success));
    });
  }

  Future<void> getCommon() async {
    emit(const GachaSpinState.loading());
    final checkConnection = getIt<GetNetworkConnectionUseCase>();
    final checkConnectionResult = await checkConnection.call(NoParams());
    checkConnectionResult.fold(
            (l) => debugPrint("$l"),
            (r) async{
          if(r != ConnectivityResult.mobile && r != ConnectivityResult.wifi)  {
            emit(const GachaSpinState.checkConnection());
          }else{
            final result = await _gachaGetCommonUC.call(NoParams());
            result.fold(
                  (l) {
                emit(GachaSpinState.fail('$l'));
              },
                  (success) {
                emit( GachaSpinState.gachaGetSuccess(success));
              },
            );
          }
        });
  }

  Future<void> getSpecial() async {
    emit(const GachaSpinState.loading());
    final checkConnection = getIt<GetNetworkConnectionUseCase>();
    final checkConnectionResult = await checkConnection.call(NoParams());
    checkConnectionResult.fold(
            (l) => debugPrint("$l"),
            (r) async{
              if(r != ConnectivityResult.mobile && r != ConnectivityResult.wifi)  {
            emit(const GachaSpinState.checkConnection());
          }else{
                final result = await _gachaGetSpecialUC.call(NoParams());
                result.fold(
                  (l) {
                emit(GachaSpinState.fail('$l'));
              },
                  (success) {
                emit( GachaSpinState.gachaGetSuccess(success));
              },
            );
          }
        });
  }
}
