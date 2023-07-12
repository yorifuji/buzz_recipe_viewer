import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dotenv_repository.g.dart';

enum EnvKey {
  algoliaApplicationId('ALGOLIA_APPLICATION_ID'),
  algoliaSearchOnlyApiKey('ALGOLIA_SEARCH_ONLY_API_KEY'),
  ;

  const EnvKey(this.value);
  final String value;
}

@riverpod
DotEnvRepository dotEnvRepository(
  DotEnvRepositoryRef ref,
) =>
    DotEnvRepository();

class DotEnvRepository {
  String call(EnvKey key) => dotenv.env[key.value] ?? '';
}
