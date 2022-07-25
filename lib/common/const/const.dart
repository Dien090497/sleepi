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

  /// GWei
  static const double gasPrice = 1.5;

  static const String snowTraceMainNetUrl = 'https://snowtrace.io/';
  static const String snowTraceTestNetUrl = 'https://testnet.snowtrace.io/';
  static const String sleeFiUrl = 'https://sleefi.com';
  static const String howToPlayUrl = 'https://sleefi.com/how-to-play';
  static const String linkTreeUrl = 'https://linktr.ee/sleefi';
  static const String litePaperUrl = 'https://sleefi.com/litepaper';
  static const String avascanUrl = 'https://avascan.info/';
  static const String binanceUrl = 'https://www.binance.com/';
  static const String okCoinUrl = 'https://www.okcoin.jp/';
  static const String contractRouterTestNet =
      '0xd7f655E3376cE2D7A2b08fF01Eb3B1023191A901';
  static const String contractRouterMainNet =
      '0x60aE616a2155Ee3d9A68541Ba4544862310933d4';
  // static const baseApiDev = 'https://dev.sleefi.com/api/v1';
  static const baseApiDev = 'https://test.sleefi.com/api/v1';
  // static const baseApiDev = 'https://staging.sleefi.com/api/v1';

  static const String whitePaperEn = 'https://sleefi.gitbook.io/whitepaper/';

  static const String whitePaperJa =
      'https://sleefi.gitbook.io/whitepaper/v/whitepaper-jp/';

  static const String whitePaperInsuranceEn = '${whitePaperEn}insurance';

  static const String whitePaperInsuranceJa = '${whitePaperJa}insurance';

  static const String normalGachaAudio = 'assets/sounds/gacha.mp3';
  static const String normalGachaAnimation = 'assets/json/gacha.json';
  static const String specialGachaAudio = 'assets/sounds/special_gacha.mp3';
  static const String specialGachaAnimation = 'assets/json/special_gacha.json';
  static const String time = 'time';
  static const String sound = 'sound';
  static const String setAsForeground = 'setAsForeground';
  static const String setAsBackground = 'setAsBackground';
  static const String stopService = 'stopService';

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
  static const tokens = [
    {
      // "address": "0xB31f66AA3C1e785363F0875A1B74E27b85FD66c7",//mainnet
      "address": "0xd00ae08403B9bbb9124bB305C09058E32C39A48c", //testnet
      "symbol": "AVAX",
      "decimal": 18,
      "totalSupply": 858592.343225,
      "icon": Ics.icAvax,
    },
    {
      "address": "0x2bB8Bc1C29F34f3795661452Bf806cB5D65DF8DC",
      "symbol": "SLFT",
      "decimal": 18,
      "totalSupply": 6003000000,
      "icon": Ics.icSlft,
    },
    {
      "address": "0x41Dd35f9e440ADecB9A04fA839D0be2b19722Ade",
      "symbol": "SLGT",
      "decimal": 18,
      "totalSupply": 12000000000,
      "icon": Ics.icSlgt,
    },
    {
      // "address": "0xB97EF9Ef8734C71904D8002F8b6Bc66Dd9c48a6E",//mainnet
      "address": "0x950C6F4F97DD62bd3cA76f084663224FD2E6b555", //testnet
      "symbol": "USDC",
      "decimal": 6,
      "totalSupply": 10000,
      "icon": Ics.icUsdc,
    },
  ];

  static const listTokenAddressMainNet = [
    '0xB97EF9Ef8734C71904D8002F8b6Bc66Dd9c48a6E',
    '0xB97EF9Ef8734C71904D8002F8b6Bc66Dd9c48a6E',
    '0xB31f66AA3C1e785363F0875A1B74E27b85FD66c7',
    '0xB97EF9Ef8734C71904D8002F8b6Bc66Dd9c48a6E'
  ];

  static const listTokenAddressTestNet = [
    '0x2bB8Bc1C29F34f3795661452Bf806cB5D65DF8DC',
    '0x41Dd35f9e440ADecB9A04fA839D0be2b19722Ade',
    '0xd00ae08403B9bbb9124bB305C09058E32C39A48c',
    '0x950C6F4F97DD62bd3cA76f084663224FD2E6b555'
  ];

  static const listNFTAddressTestNet = [
    '0x75A78Ca9e9B43c8ae1dB1844238937E340f5C46a',
    '0x04a4339CD0BBB87869E7eAdDAc758586be079b9E',
    '0xe019864178C81547aA099cE5b612766eBC126929',
    '0x04a4339CD0BBB87869E7eAdDAc758586be079b9E',
  ];

  static const listNFTAddressMainNet = [
    '',
    '',
    '',
    '',
  ];

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
    'assets/sounds/crystals.mp3',
    'assets/sounds/iphone_alarm.mp3',
    'assets/sounds/reflection.mp3',
    'assets/sounds/school_alarm.mp3',
  ];

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
