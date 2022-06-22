import 'dart:developer';

import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@Injectable()
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
      log("res: onInstallConversionData $res");
    });

    _appsflyerSdk.onAppOpenAttribution((res) {
      log(" res: onAppOpenAttribution: $res");
    });

    _appsflyerSdk.onDeepLinking((DeepLinkResult dp) {
      switch (dp.status) {
        case Status.FOUND:
          log('${dp.deepLink?.toString()}');
          log('${dp.toJson()}');
          log("deep link value: ${dp.deepLink?.deepLinkValue}");
          break;
        case Status.NOT_FOUND:
          log("deep link not found");
          break;
        case Status.ERROR:
          log("deep link error: ${dp.error}");
          break;
        case Status.PARSE_ERROR:
          log("deep link status parsing error");
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
