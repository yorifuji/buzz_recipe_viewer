import 'package:algolia_helper_flutter/algolia_helper_flutter.dart';
import 'package:buzz_recipe_viewer/domain/model/environment.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'algolia_client_provider.g.dart';

@riverpod
HitsSearcher algoliaClient(Ref ref, {required String indexName}) {
  return HitsSearcher(
    applicationID: Environment.algoliaApplicationId.value,
    apiKey: Environment.algoliaSearchOnlyApiKey.value,
    indexName: indexName,
  );
}
