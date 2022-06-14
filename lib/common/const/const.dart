import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class Const {
  static const int passcodeLength = 6;

  /// GWei
  static const double gasPrice = 1.5;

  static const String howToPlayUrl = 'https://sleefi.com/how-to-play';
  static const String linkTreeUrl = 'https://linktr.ee/sleefi';
  static const String litePaperUrl = 'https://sleefi.com/litepaper';
  static const String avascanUrl = 'https://avascan.info/';
  static const String binanceUrl = 'https://www.binance.com/';

  static const String whitePaperEn = 'https://sleefi.gitbook.io/whitepaper/';

  static const String whitePaperJa =
      'https://sleefi.gitbook.io/whitepaper/v/whitepaper-jp/';

  static const String whitePaperInsuranceEn = '${whitePaperEn}insurance';

  static const String whitePaperInsuranceJa = '${whitePaperJa}insurance';

  static const localeDE = Locale('de', 'DE');
  static const localeEN = Locale('en', 'US');
  static const localeES = Locale('es', 'ES');
  static const localeFR = Locale('fr', 'FR');
  static const localeJA = Locale('ja', 'JP');
  static const localePT = Locale('pt', 'T');
  static const localeRU = Locale('ru', 'RU');
  static const localeZH = Locale('zh', 'Hans');

  static const locales = [
    localeDE,
    localeEN,
    localeES,
    localeFR,
    localeJA,
    localePT,
    localeRU,
    localeZH,
  ];

  static const isoLangs = {
    "de": {"name": "German", "nativeName": "Deutsch"},
    "en": {"name": "English", "nativeName": "English"},
    "es": {"name": "Spanish", "nativeName": "Español"},
    "fr": {"name": "French", "nativeName": "Français"},
    "ja": {
      "name": "Japanese",
      // "nativeName":"日本語 (にほんご／にっぽんご)"
      "nativeName": "日本語"
    },
    "pt": {"name": "Portuguese", "nativeName": "Português"},
    "ru": {"name": "Russian", "nativeName": "русский язык"},
    "zh": {
      "name": "Chinese",
      "nativeName": "中国人"
      // "nativeName":"中文 (Zhōngwén), 汉语, 漢語"
    },
  };

  Const._();
}

extension LocaleX on Locale {
  String get displayName {
    switch (languageCode) {
      case "de":
        return LocaleKeys.german.tr();
      case "en":
        return LocaleKeys.english.tr();
      case "es":
        return LocaleKeys.spanish.tr();
      case "fr":
        return LocaleKeys.french.tr();
      case "ja":
        return LocaleKeys.japanese.tr();
      case "pt":
        return LocaleKeys.portuguese.tr();
      case "ru":
        return LocaleKeys.russian.tr();
      case "zh":
        return LocaleKeys.chinese.tr();
    }
    return languageCode;
  }

  String get nativeName {
    try {
      return Const.isoLangs[languageCode]!['nativeName']!;
    } catch (e) {
      return languageCode;
    }
  }
}
