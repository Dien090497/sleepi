import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/resources/resources.dart';

class Const {
  static const int passcodeLength = 6;

  /// GWei
  static const double gasPrice = 1.5;

  static const String sleeFiUrl = 'https://sleefi.com';
  static const String howToPlayUrl = 'https://sleefi.com/how-to-play';
  static const String linkTreeUrl = 'https://linktr.ee/sleefi';
  static const String litePaperUrl = 'https://sleefi.com/litepaper';
  static const String avascanUrl = 'https://avascan.info/';
  static const String binanceUrl = 'https://www.binance.com/';
  static const String okCoinUrl = 'https://www.okcoin.jp/';

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

  static const tokens = [
    {
      // "address": "0xB31f66AA3C1e785363F0875A1B74E27b85FD66c7",//mainnet
      "address": "0xd00ae08403B9bbb9124bB305C09058E32C39A48c",//testnet
      "symbol": "AVAX",
      "decimal": 18,
      "icon": Ics.icAvax,
    },
    {
      "address": "0x2bB8Bc1C29F34f3795661452Bf806cB5D65DF8DC",
      "symbol": "SLFT",
      "decimal": 18,
      "icon": Ics.icSlft,
    },
    {
      "address": "0x41Dd35f9e440ADecB9A04fA839D0be2b19722Ade",
      "symbol": "SLGT",
      "decimal": 18,
      "icon": Ics.icSlgt,
    },
    {
      // "address": "0xB97EF9Ef8734C71904D8002F8b6Bc66Dd9c48a6E",//mainnet
      "address": "0x950C6F4F97DD62bd3cA76f084663224FD2E6b555",//testnet
      "symbol": "USDC",
      "decimal": 6,
      "icon": Ics.icUsdc,
    },
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
