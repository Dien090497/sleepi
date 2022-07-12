import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:slee_fi/app.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/widgets/phoenix.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/usecase/run_app_init_usecase.dart';
import 'package:slee_fi/usecase/usecase.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.wait([
    GetStorage.init(),
    EasyLocalization.ensureInitialized(),
    configureDependencies(),
  ]);
  await Future.wait([
    getIt<RunAppInitUseCase>().call(NoParams()),
  ]);

  /// Lock in portrait mode only
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    BlocOverrides.runZoned(
      () => runApp(Phoenix(
        child: EasyLocalization(
          supportedLocales: Const.locales,
          path: 'assets/translations',
          fallbackLocale: Const.localeEN,
          child: const MyApp(),
        ),
      )),
      blocObserver: AppBlocObserver(),
    );
  });
}

/// Custom [BlocObserver] that observes all bloc and cubit state changes.
class AppBlocObserver extends BlocObserver {
  final Logger _logger = Logger();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    if (bloc is Cubit) _logger.i(change);
  }

  @override
  void onTransition(
      Bloc<dynamic, dynamic> bloc, Transition<dynamic, dynamic> transition) {
    super.onTransition(bloc, transition);
    _logger.i(transition);
  }
}
