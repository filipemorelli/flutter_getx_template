enum Flavor {
  DEV,
  QA,
  PROD,
}

class F {
  static Flavor? appFlavor;

  static String get title {
    switch (appFlavor) {
      case Flavor.DEV:
        return 'SecretWall dev';
      case Flavor.QA:
        return 'SecretWall qa';
      case Flavor.PROD:
        return 'SecretWall';
      default:
        return 'title';
    }
  }

  static String get serverUrl {
    switch (appFlavor) {
      case Flavor.DEV:
        return 'http://192.168.2.110:3000/';
      case Flavor.QA:
        return 'http://192.168.2.110:4000/';
      case Flavor.PROD:
        return 'http://192.168.2.110:8080/';
      default:
        return '';
    }
  }
}
