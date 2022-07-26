import 'dart:async';
import 'dart:developer';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_storage/get_storage.dart';
import 'package:just_audio/just_audio.dart';
import 'package:logger/logger.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slee_fi/app.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/flavors.dart';
import 'package:slee_fi/usecase/run_app_init_usecase.dart';
import 'package:slee_fi/usecase/usecase.dart';

Future<void> run() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.wait([
    GetStorage.init(),
    EasyLocalization.ensureInitialized(),
    configureDependencies(F.name.toLowerCase()),
  ]);
  await Future.wait([
    getIt<RunAppInitUseCase>().call(NoParams()),
    initializeService(),
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]),
  ]);

  BlocOverrides.runZoned(
    () async => await Sentry.init(
      (options) {
        options.dsn =
            'https://9afba6dcc9e742eea36ba51bef7238ad@o1325661.ingest.sentry.io/6584991';
      },
      appRunner: () => runApp(EasyLocalization(
        supportedLocales: Const.locales,
        path: 'assets/translations',
        fallbackLocale: Const.localeEN,
        child: const MyApp(),
      )), // Init your App.
    ),
    blocObserver: AppBlocObserver(),
  );
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

Future<void> initializeService() async {
  final service = FlutterBackgroundService();
  await service.configure(
    androidConfiguration: AndroidConfiguration(
      // this will executed when app is in foreground or background in separated isolate
      onStart: onStart,
      // auto start service
      autoStart: false,
      isForegroundMode: true,
    ),
    iosConfiguration: IosConfiguration(
      // auto start service
      autoStart: false,
      // this will executed when app is in foreground in separated isolate
      onForeground: onStart,

      // you have to enable background fetch capability on xcode project
      onBackground: onIosBackground,
    ),
  );
  // await service.startService();
}

// to ensure this executed
// run app from xcode, then from xcode menu, select Simulate Background Fetch
bool onIosBackground(ServiceInstance service) {
  WidgetsFlutterBinding.ensureInitialized();
  log('FLUTTER BACKGROUND FETCH');

  return true;
}

Future<void> onStart(ServiceInstance service) async {
  try {
    DartPluginRegistrant.ensureInitialized();
    final audioPlayer = AudioPlayer();

    if (service is AndroidServiceInstance) {
      service.on(Const.setAsForeground).listen((event) {
        service.setAsForegroundService();
      });

      service.on(Const.setAsBackground).listen((event) {
        service.setAsBackgroundService();
      });
    }

    service.on(Const.stopService).listen((event) async {
      if (audioPlayer.playing) {
        await audioPlayer.stop();
      }
      await audioPlayer.dispose();
      service.stopSelf();
    });

    SharedPreferences preferences = await SharedPreferences.getInstance();
    final int timeWakeUp = preferences.getInt(Const.time) ?? 0;
    final int sound = preferences.getInt(Const.sound) ?? 0;
    final DateTime wakeUp = DateTime.fromMillisecondsSinceEpoch(timeWakeUp);
    final int time = wakeUp.difference(DateTime.now()).inSeconds;

    if (service is AndroidServiceInstance) {
      service.setForegroundNotificationInfo(
        title: "Sleep Tracking...",
        content:
            "Alarm: ${DateFormat('HH:mm dd/MM/yyyy').format(wakeUp).toString()}",
      );
    }

    print("=--=-==-$time");

    Timer.periodic(Duration(seconds: time), (timer) async {
      if (!audioPlayer.playing) {
        print("=--=-==-playing$time");
        await audioPlayer.setAsset(Const.soundAlarm[sound]).then((value) async {
          await audioPlayer.setVolume(1);
          await audioPlayer.setLoopMode(LoopMode.all);
          await audioPlayer.play();
        });
      }
      timer.cancel();
    });
  } catch (e) {
    service.stopSelf();
  }
}
