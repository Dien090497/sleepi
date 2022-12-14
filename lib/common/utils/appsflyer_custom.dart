import 'dart:io';

import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class AppFlyerCustom {
  final AppsFlyerOptions _appsFlyerOptions = AppsFlyerOptions(
    afDevKey: Platform.isAndroid
        ? 'qCWYnmVaZy4cwWWjm3RB5P'
        : 'Be7KEPxvVdSNz26dG7f79B',
    appId: '1623163183',
    showDebug: true,
  );

  late final AppsflyerSdk _appsflyerSdk;

  Future<void> init() async {
    _appsflyerSdk = AppsflyerSdk(_appsFlyerOptions);
    await _appsflyerSdk.initSdk(
        registerConversionDataCallback: true,
        registerOnAppOpenAttributionCallback: true,
        registerOnDeepLinkingCallback: true);

    _appsflyerSdk.onInstallConversionData((res) {});

    _appsflyerSdk.onAppOpenAttribution((res) {});

    _appsflyerSdk.onDeepLinking((DeepLinkResult dp) {
      switch (dp.status) {
        case Status.FOUND:
          break;
        case Status.NOT_FOUND:
          break;
        case Status.ERROR:
          break;
        case Status.PARSE_ERROR:
          break;
      }
    });
  }

  signIn() {
    _logEvent('sign_in');
  }

  homeAction(int index) {
    String event = '';
    switch (index) {
      case 0:
        event = 'home';
        break;
      case 1:
        event = 'gacha';
        break;
      case 2:
        event = 'list';
        break;
      case 3:
        event = 'chart';
        break;
      case 4:
        event = 'market';
        break;
    }
    _logEvent('home_action_$event');
  }

  _logEvent(String eventName, {Map? map}) async {
    if (kDebugMode) {
      return;
    }

    try {
      await _appsflyerSdk.logEvent(eventName, map);
    } on Exception catch (_) {}
  }
}
