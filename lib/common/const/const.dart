import 'package:flutter/material.dart';

class Const {
  static const int passcodeLength = 6;

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
    try {
      return Const.isoLangs[languageCode]!['name']!;
    } catch (e) {
      return languageCode;
    }
  }

  String get nativeName {
    try {
      return Const.isoLangs[languageCode]!['nativeName']!;
    } catch (e) {
      return languageCode;
    }
  }
}
