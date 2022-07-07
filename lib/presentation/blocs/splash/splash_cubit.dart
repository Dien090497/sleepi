import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/presentation/blocs/splash/splash_state.dart';
import 'package:slee_fi/usecase/get_global_config.dart';
import 'package:slee_fi/usecase/usecase.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState.initial());

  final _getGlobalConfigUseCase = getIt<GetGlobalConfigUseCase>();

  void init() async {
    await Permission.location.request();
    //final isSafeDevice = await SafeDevice.isSafeDevice;
    final result = await _getGlobalConfigUseCase.call(NoParams());
    result.fold((l) {
      emit(SplashState.error('$l'));
    }, (r) {
      emit(const SplashState.done(isSafeDevice: kDebugMode ? true : true));
    });
  }
}
