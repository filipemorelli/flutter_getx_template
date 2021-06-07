enum Flavor {
  DEV,
  QA,
  PROD,
}

// ignore: avoid_classes_with_only_static_members
class F {
  static Flavor? appFlavor;

  static String get env {
    switch (appFlavor) {
      case Flavor.DEV:
        return '.env-dev';
      case Flavor.QA:
        return '.env-qa';
      case Flavor.PROD:
        return '.env-prod';
      default:
        return '.env';
    }
  }
}
