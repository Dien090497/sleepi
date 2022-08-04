enum Flavor {
  prod,
  dev,
  stg,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.prod:
        return 'SleeFi';
      case Flavor.dev:
        return 'SleeFi Dev';
      case Flavor.stg:
        return 'SleeFi Stg';
      default:
        return 'title';
    }
  }
}
