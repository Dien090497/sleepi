import 'package:flutter/cupertino.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:slee_fi/di/injector.dart';

import 'widgetbook.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    configureDependencies(),
  ]);

  final delegate = await LocalizationDelegate.create(
    fallbackLocale: 'en_US',
    supportedLocales: ['en_US', 'ja_JP'],
    preferences: getIt<ITranslatePreferences>(),
  );

  /// Lock in portrait mode only
  runApp(LocalizedApp(delegate, const HotReloadWidgetBook()));
}
