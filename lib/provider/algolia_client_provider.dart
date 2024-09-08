import 'package:algolia_helper_flutter/algolia_helper_flutter.dart';
import 'package:buzz_recipe_viewer/repository/dotenv_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'algolia_client_provider.g.dart';

@riverpod
HitsSearcher algoliaClient(AlgoliaClientRef ref, {required String indexName}) {
  final dotEnvRepository = ref.watch(dotEnvRepositoryProvider);

  return HitsSearcher(
    applicationID: dotEnvRepository(EnvKey.algoliaApplicationId),
    apiKey: dotEnvRepository(EnvKey.algoliaSearchOnlyApiKey),
    indexName: indexName,
  );
}
