import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizationDelegate = LocalizedApp.of(context).delegate;

    return LocalizationProvider(
      state: LocalizationProvider.of(context).state,
      child: MaterialApp(
        title: 'SleeFi',
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          localizationDelegate,
        ],
        supportedLocales: localizationDelegate.supportedLocales,
        locale: localizationDelegate.currentLocale,
        theme: ThemeData(primarySwatch: Colors.blue),
      ),
    );
  }
}
