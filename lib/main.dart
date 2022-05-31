import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_translate/flutter_translate.dart';
import 'package:logger/logger.dart';
import 'package:slee_fi/app.dart';
import 'package:slee_fi/di/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Future.wait([
    configureDependencies(),
  ]);

  // final delegate = await LocalizationDelegate.create(
  //   fallbackLocale: 'en_US',
  //   supportedLocales: ['en_US', 'ja_JP'],
  //   preferences: getIt<ITranslatePreferences>(),
  // );

  /// Lock in portrait mode only
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    BlocOverrides.runZoned(
      // () => runApp(LocalizedApp(delegate, const MyApp())),
      () => runApp(EasyLocalization(
        supportedLocales: const [Locale('en', 'US'), Locale('ja', 'JP')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en', 'US'),
        child: const MyApp(),
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
