import 'package:algolia/algolia.dart';
import 'package:buzz_recipe_viewer/model/search_hit.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_hits_view_model.freezed.dart';

final searchHitsProvider =
    StateNotifierProvider<SearchHitsViewModel, SearchHitsState>((ref) {
  return SearchHitsViewModel();
});

@freezed
class SearchHitsState with _$SearchHitsState {
  const factory SearchHitsState({
    @Default('') String query,
    @Default(<SearchHitItem>[]) List<SearchHitItem> hitList,
  }) = _SearchHitsState;
}

class SearchHitsViewModel extends StateNotifier<SearchHitsState> {
  SearchHitsViewModel() : super(const SearchHitsState()) {
    search();
  }

  Future<void> search() async {
    final Algolia algoliaClient = Algolia.init(
      applicationId: dotenv.env["ALGOLIA_APPLICATION_ID"]!,
      apiKey: dotenv.env["ALGOLIA_API_KEY"]!,
    );
    AlgoliaQuery algoliaQuery = algoliaClient.instance
        .index("recipe_views_desc")
        .setHitsPerPage(100)
        .query(state.query);
    AlgoliaQuerySnapshot snapshot = await algoliaQuery.getObjects();
    final hits = snapshot.toMap()['hits'] as List;
    // print(hits.length);
    final searchHitList =
        List<SearchHit>.from(hits.map((hit) => SearchHit.fromJson(hit)));
    state = state.copyWith(
        hitList: searchHitList
            .map(
              (e) => SearchHitItem(
                searchHit: e,
              ),
            )
            .toList());
  }

  void toogleDescription(SearchHitItem item) {
    final newHitList = state.hitList.map((e) {
      if (e.searchHit.id == item.searchHit.id) {
        return SearchHitItem(
          searchHit: e.searchHit,
          isDescriptionExpanded: !e.isDescriptionExpanded,
        );
      } else {
        return e;
      }
    }).toList();

    state = state.copyWith(hitList: newHitList);
  }

  void updateQuery(String query) {
    state = state.copyWith(query: query);
  }
}
