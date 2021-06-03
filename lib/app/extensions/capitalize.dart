extension CapitalizeString on String {
  String get capitalizeFirst {
    if (this.length > 1) {
      return this[0].toUpperCase() + this.substring(1, this.length);
    }
    return this.toUpperCase();
  }
}
