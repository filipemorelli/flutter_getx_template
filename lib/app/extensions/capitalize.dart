extension CapitalizeString on String {
  String get capitalizeFirst {
    if (length > 1) {
      return this[0].toUpperCase() + substring(1, length);
    }
    return toUpperCase();
  }
}
