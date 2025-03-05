import 'package:buzz_recipe_viewer/data/repository/video_repository.dart';
import 'package:buzz_recipe_viewer/data/repository/video_repository_mock.dart';
import 'package:buzz_recipe_viewer/data/store/video/search_state_store.dart';
import 'package:buzz_recipe_viewer/domain/model/flavor.dart';
import 'package:buzz_recipe_viewer/domain/model/result.dart';
import 'package:buzz_recipe_viewer/domain/model/sort_index.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'video_service.g.dart';

@riverpod
VideoService videoService(Ref ref) => VideoService(
      Flavor.isDev()
          ? ref.watch(videoRepositoryMockProvider)
          : ref.watch(videoRepositoryProvider),
      ref.watch(searchStateStoreProvider.notifier),
    );

class VideoService {
  VideoService(
    this._videoRepository,
    this._searchStateStore,
  );

  final VideoRepository _videoRepository;
  final SearchStateStore _searchStateStore;

  Future<bool> getVideoList(String query, SortIndex sortIndex) async {
    final result =
        await _videoRepository.getVideoList(query, sortIndex.indexName, 0);

    switch (result) {
      case Success(:final data):
        _searchStateStore
          ..setQuery(query)
          ..setSortType(sortIndex)
          ..setNextPage(data.nextPage)
          ..setSearchHits(data.searchHits);
      case Failure():
      // TODO: handle error
    }

    return result.isSuccess;
  }

  Future<bool> getVideoListMore() async {
    final result = await _videoRepository.getVideoList(
      _searchStateStore.query(),
      _searchStateStore.sortType().indexName,
      _searchStateStore.nextPage(),
    );

    switch (result) {
      case Success(:final data):
        _searchStateStore
          ..setNextPage(data.nextPage)
          ..addSearchHits(data.searchHits);
      case Failure():
      // TODO: handle error
    }

    return result.isSuccess;
  }
}
