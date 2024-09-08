import 'package:algolia_helper_flutter/algolia_helper_flutter.dart';
import 'package:buzz_recipe_viewer/model/search_hit.dart';
import 'package:buzz_recipe_viewer/model/search_request.dart';
import 'package:buzz_recipe_viewer/provider/algolia_client_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_result_provider.g.dart';

class SearchMetadata {
  const SearchMetadata(this.nbHits, this.nbPages, this.page, this.hitsPerPage);

  factory SearchMetadata.fromResponse(SearchResponse response) =>
      SearchMetadata(
        response.nbHits,
        response.nbPages,
        response.page,
        response.hitsPerPage,
      );

  final int nbHits;
  final int nbPages;
  final int page;
  final int hitsPerPage;
}

class HitsPage {
  const HitsPage(this.items, this.pageKey, this.nextPageKey);

  factory HitsPage.fromResponse(SearchResponse response) {
    final items = response.hits.map(SearchHit.fromJson).toList();
    final isLastPage = response.page >= response.nbPages;
    final nextPageKey = isLastPage ? null : response.page + 1;
    return HitsPage(items, response.page, nextPageKey);
  }

  final List<SearchHit> items;
  final int pageKey;
  final int? nextPageKey;
}

// alias
typedef SearchResult = ({SearchMetadata metadata, HitsPage hitsPage});

@riverpod
Stream<SearchResult> searchResult(
  SearchResultRef ref, {
  required String indexName,
  required SearchRequest searchRequest,
}) async* {
  final client = ref.watch(algoliaClientProvider(indexName: indexName))
    ..applyState(
      (state) => state.copyWith(
        query: searchRequest.query,
        page: searchRequest.page,
        hitsPerPage: searchRequest.hitsPerPage,
      ),
    );

  await for (final res in client.responses) {
    final metadata = SearchMetadata.fromResponse(res);
    final hitsPage = HitsPage.fromResponse(res);
    yield (metadata: metadata, hitsPage: hitsPage);
  }
}
