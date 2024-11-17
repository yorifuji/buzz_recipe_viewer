enum Flavor {
  dev,
  stg,
  prod,
  ;

  factory Flavor._fromEnvironment() =>
      Flavor._fromString(const String.fromEnvironment('FLAVOR'));
  factory Flavor._fromString(String value) =>
      values.firstWhere((e) => e.name == value);

  static bool isDev() => Flavor._fromEnvironment() == Flavor.dev;
  static bool isStg() => Flavor._fromEnvironment() == Flavor.stg;
  static bool isProd() => Flavor._fromEnvironment() == Flavor.prod;
}
