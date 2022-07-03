import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/presentation/blocs/setting/setting_event.dart';
import 'package:slee_fi/presentation/blocs/setting/setting_state.dart';
import 'package:slee_fi/usecase/current_user_usecase.dart';
import 'package:slee_fi/usecase/get_current_network_usecase.dart';
import 'package:slee_fi/usecase/usecase.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(const SettingState.initial()) {
    on<GetCurrentNetWork>(getCurrentNetWork);
    on<SwitchNetWork>(switchNetWork);
    on<InitSetting>(fetchUser);
  }

  final _currentUserUC = getIt<CurrentUserUseCase>();
  final _getCurrentNetworkUseCase = getIt<GetCurrentNetworkUseCase>();

  Future<void> getCurrentNetWork(
      GetCurrentNetWork event, Emitter<SettingState> emit) async {
    final result = await _getCurrentNetworkUseCase.call(null);
    result.fold((l) {
      emit(const SettingState.error());
    }, (currentNetwork) {
      emit(SettingState.loaded(network: currentNetwork));
    });
  }

  Future<void> switchNetWork(
      SwitchNetWork event, Emitter<SettingState> emit) async {
    final result = await _getCurrentNetworkUseCase.call(event.netWorkEnum);
    result.fold((l) {
      emit(const SettingState.error());
    }, (currentNetwork) {
      emit(SettingState.loaded(network: currentNetwork));
    });
  }

  Future<void> fetchUser(InitSetting event, Emitter<SettingState> emit) async {
    final result = await _currentUserUC.call(NoParams());
    result.fold((l) {}, (userInfoModel) {
      emit(SettingState.loadUserSuccess(userInfoModel));
    });
  }
}
