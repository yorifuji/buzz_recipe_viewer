import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'flavor.g.dart';

enum Flavor {
  dev,
  stg,
  prod,
  ;

  factory Flavor.fromString(String value) =>
      values.firstWhere((e) => e.name == value);

  bool get isDev => this == Flavor.dev;
  bool get isStg => this == Flavor.stg;
  bool get isProd => this == Flavor.prod;
}

@riverpod
Flavor flavor(FlavorRef ref) =>
    Flavor.fromString(const String.fromEnvironment('FLAVOR'));
