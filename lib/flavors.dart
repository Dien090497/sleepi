enum Flavor {
  PROD,
  DEV,
  TEST,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.PROD:
        return 'SleeFi';
      case Flavor.DEV:
        return 'SleeFi Dev';
      case Flavor.TEST:
        return 'SleeFi Stg';
      default:
        return 'title';
    }
  }
}