import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/resources/resources.dart';

class Const {
  static const int one = 1;
  static const int two = 2;
  static const int three = 3;
  static const int four = 4;

  static const int passcodeLength = 6;

  static const double bedMintMax = 7;
  static const double bedLevelMax = 30;

  static const double tokenEarnMaxPerDay = 800;

  /// GWei
  static const double gasPrice = 1.5;
  static const double defaultEstimateGas = 0.003156325;

  static const String howToPlayUrl = 'https://sleefi.com/how-to-play';
  static const String linkTreeUrl = 'https://linktr.ee/sleefi';
  static const String litePaperUrl = 'https://sleefi.com/litepaper';
  static const String avascanUrl = 'https://avascan.info/';
  static const String binanceUrlEn =
      'https://accounts.binance.com/en/register?ref=Y528ROVY';
  static const String binanceUrlJa =
      'https://accounts.binance.com/ja/register?ref=Y528ROVY';
  static const String okCoinUrl = 'https://www.okcoin.jp/';

  static const String whitePaperEn = 'https://sleefi.gitbook.io/whitepaper/';

  static const String whitePaperJa =
      'https://sleefi.gitbook.io/whitepaper/v/whitepaper-jp/';

  static const String whitePaperInsuranceEn = '${whitePaperEn}insurance';

  static const String whitePaperInsuranceJa = '${whitePaperJa}insurance';

  static const String normalGachaAudio = 'assets/sounds/gacha.mp3';
  static const String normalGachaAnimation = 'assets/json/gacha.json';
  static const String specialGachaAudio = 'assets/sounds/special_gacha.mp3';
  static const String specialGachaAnimation = 'assets/json/special_gacha.json';
  static const String bedMintingAnimation = 'assets/json/bed_minting.json';
  static const String bedBrokenAnimation = 'assets/json/bed_broken_with_text.json';
  static const String itemBrokenAnimation = 'assets/json/item_broken.json';
  static const String jewelBrokenAnimation = 'assets/json/jewel_broken_with_text.json';
  static const String purpleBedBoxAnimation = 'assets/json/purple_bedbox.json';
  static const String blackBedBoxAnimation = 'assets/json/black_bedbox.json';
  static const String orangeBedBoxAnimation = 'assets/json/orange_bedbox.json';
  static const String blueBedBoxAnimation = 'assets/json/blue_bedbox.json';
  static const String greenBedBoxAnimation = 'assets/json/green_bedbox.json';
  static const String blackLuckyBoxAnimation = 'assets/json/black_lucky_box.json';
  static const String purpleLuckyBoxAnimation = 'assets/json/purple_lucky_box.json';
  static const String orangeLuckyBoxAnimation = 'assets/json/orange_lucky_box.json';
  static const String greenLuckyBoxAnimation = 'assets/json/green_lucky_box.json';
  static const String blueLuckyBoxAnimation = 'assets/json/blue_lucky_box.json';
  static const String successAnimation = 'assets/json/success.json';

  static const String time = 'time';
  static const String sound = 'sound';
  static const String setAsForeground = 'setAsForeground';
  static const String setAsBackground = 'setAsBackground';
  static const String stopService = 'stopService';
  static const String suggestionEmail = 'suggestion_email';

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

  static const sortCondition = ["LowPrice", "HighPrice", "Latest"];

  static const String deadAddress =
      '0x0000000000000000000000000000000000000000';

  static const listTypeHistory = [
    'txlist',
    'tokentx',
    'tokennfttx',
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

  static const luckyBoxes = [
    Imgs.icLuckyBoxBlack,
    Imgs.icLuckyBoxBlue,
    Imgs.icLuckyBoxGreen,
    Imgs.icLuckyBoxOrange,
    Imgs.icLuckyBoxPurple,
  ];

  static const soundAlarm = [
    'assets/sounds/apex.mp3',
    'assets/sounds/iphone_alarm.mp3',
    'assets/sounds/crystals.mp3',
    'assets/sounds/reflection.mp3',
    'assets/sounds/school_alarm.mp3',
  ];
  static const nameSoundAlarm = [
    LocaleKeys.apex,
    LocaleKeys.radar,
    LocaleKeys.crystals,
    LocaleKeys.reflection,
    LocaleKeys.school,
  ];

  Const._();

  static Const get I => _instance;

  static final Const _instance = Const._();
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
