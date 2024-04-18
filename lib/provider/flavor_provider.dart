import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'flavor_provider.g.dart';

enum Flavor {
  dev,
  stg,
  prod,
  ;

  static Flavor fromString(String value) => values.firstWhere(
        (e) => e.name == value,
        orElse: () => throw ArgumentError('Invalid flavor: $value'),
      );

  bool get isDev => this == Flavor.dev;
  bool get isStg => this == Flavor.stg;
  bool get isProd => this == Flavor.prod;
}

@riverpod
Flavor flavor(FlavorRef ref) =>
    Flavor.fromString(const String.fromEnvironment('FLAVOR'));
