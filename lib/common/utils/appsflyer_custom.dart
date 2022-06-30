import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/common/extensions/string_x.dart';

@Singleton()
class AppFlyerCustom {
  AppsFlyerOptions appsFlyerOptions = AppsFlyerOptions(
    afDevKey: 'Be7KEPxvVdSNz26dG7f79B',
    appId: '1623163183',
    showDebug: kDebugMode,
    disableAdvertisingIdentifier: true,
  );

  late final AppsflyerSdk _appsflyerSdk = AppsflyerSdk(appsFlyerOptions);

  init() async {
    await _appsflyerSdk.initSdk(
        registerConversionDataCallback: true,
        registerOnAppOpenAttributionCallback: true,
        registerOnDeepLinkingCallback: true);
    _logEvent('iostest');
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

  _logEvent(String eventName, {Map? map}) async {
    if (kDebugMode) {
      'event name  $eventName    data $map'.log;
      return;
    }

    try {
      var result = await _appsflyerSdk.logEvent(eventName, map);
      ' result log   $result $eventName'.log;
    } on Exception catch (e) {
      '$e'.log;
    }
  }
}
