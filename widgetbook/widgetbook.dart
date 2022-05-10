import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:slee_fi/common/style/theme.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/sf_textfield.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:widgetbook/widgetbook.dart';

class HotReloadWidgetBook extends StatelessWidget {
  const HotReloadWidgetBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizationDelegate = LocalizedApp.of(context).delegate;

    return Widgetbook.material(
      themes: [WidgetbookTheme(name: 'dark', data: darkTheme)],
      appInfo: AppInfo(name: 'SleeFi'),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        localizationDelegate,
      ],
      supportedLocales: localizationDelegate.supportedLocales,
      categories: [
        WidgetbookCategory(name: 'Widgets', widgets: [
          WidgetbookComponent(name: 'Common', useCases: [
            WidgetbookUseCase(
              name: 'SFText',
              builder: (_) => SFText(keyText: Keys.testHello),
            ),
            WidgetbookUseCase(
              name: 'SFTextField',
              builder: (_) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                alignment: Alignment.center,
                child: const SFTextField(),
              ),
            ),
            WidgetbookUseCase(
              name: 'SFButton',
              builder: (_) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                alignment: Alignment.center,
                child: const SFButton(text: 'START'),
              ),
            ),
          ]),
        ]),
      ],
    );
  }
}
