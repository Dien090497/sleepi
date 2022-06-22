
import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class AppFlyerCustom {
  AppsFlyerOptions appsFlyerOptions = AppsFlyerOptions(
    afDevKey: 'qCWYnmVaZy4cwWWjm3RB5P',
    appId: '',
    showDebug: kDebugMode,
    disableAdvertisingIdentifier: true,
  );

  late final AppsflyerSdk _appsflyerSdk = AppsflyerSdk(appsFlyerOptions);

  init() async {
    await _appsflyerSdk.initSdk(
        registerConversionDataCallback: true,
        registerOnAppOpenAttributionCallback: true,
        registerOnDeepLinkingCallback: true);

    _appsflyerSdk.onInstallConversionData((res) {
    });

    _appsflyerSdk.onAppOpenAttribution((res) {
    });

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



  // _logEvent(String eventName, {Map? map}) async {
  //   if (kDebugMode) {
  //     log('event name  $eventName    data $map');
  //     return;
  //   }
  //
  //   try {
  //     var result = await _appsflyerSdk.logEvent(eventName, map);
  //     log(' result log   $result $eventName');
  //   } on Exception catch (e) {
  //     log('$e');
  //   }
  // }
}
