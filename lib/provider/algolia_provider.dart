import 'package:algolia/algolia.dart';
import 'package:buzz_recipe_viewer/repository/dotenv_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'algolia_provider.g.dart';

@riverpod
Algolia algolia(AlgoliaRef ref) {
  final dotEnvRepository = ref.watch(dotEnvRepositoryProvider);
  return Algolia.init(
    applicationId: dotEnvRepository(EnvKey.algoliaApplicationId),
    apiKey: dotEnvRepository(EnvKey.algoliaSearchOnlyApiKey),
  );
}
