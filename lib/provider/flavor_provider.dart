import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'flavor_provider.g.dart';

enum Flavor {
  dev,
  stg,
  prod,
  ;

  static Flavor fromString(String flavor) {
    switch (flavor) {
      case 'dev':
        return Flavor.dev;
      case 'stg':
        return Flavor.stg;
      case 'prod':
        return Flavor.prod;
      default:
        throw ArgumentError('Unknown flavor: $flavor');
    }
  }
}

@riverpod
Flavor flavor(FlavorRef ref) =>
    Flavor.fromString(const String.fromEnvironment('FLAVOR'));
