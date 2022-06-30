import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:safe_device/safe_device.dart';
import 'package:slee_fi/presentation/blocs/splash/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState.initial());

  void init() async {
    await Permission.location.request();
    final isSafeDevice = await SafeDevice.isSafeDevice;
    emit(SplashState.done(isSafeDevice: kDebugMode ? true : isSafeDevice));
  }
}
