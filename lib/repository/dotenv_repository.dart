import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dotenv_repository.g.dart';

@riverpod
DotEnvRepository dotEnvRepository(
  DotEnvRepositoryRef ref,
) =>
    DotEnvRepository();

class DotEnvRepository {
  String get algoliaApplicationId => dotenv.env['ALGOLIA_APPLICATION_ID'] ?? '';
  String get algoliaSearchOnlyApiKey =>
      dotenv.env['ALGOLIA_SEARCH_ONLY_API_KEY'] ?? '';
}
