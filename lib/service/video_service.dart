import 'package:buzz_recipe_viewer/model/flavor.dart';
import 'package:buzz_recipe_viewer/model/sort_index.dart';
import 'package:buzz_recipe_viewer/repository/video_repository.dart';
import 'package:buzz_recipe_viewer/repository/video_repository_mock.dart';
import 'package:buzz_recipe_viewer/store/video/search_state_store.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'video_service.g.dart';

@riverpod
VideoService videoService(VideoServiceRef ref) => VideoService(
      ref.watch(flavorProvider).isDev
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

    result.when(
      success: (data) {
        _searchStateStore
          ..setQuery(query)
          ..setSortType(sortIndex)
          ..setNextPage(data.nextPage)
          ..setSearchHits(data.searchHits);
      },
      failure: (error) {},
    );

    return result.isSuccess;
  }

  Future<bool> getVideoListMore() async {
    final result = await _videoRepository.getVideoList(
      _searchStateStore.query(),
      _searchStateStore.sortType().indexName,
      _searchStateStore.nextPage(),
    );

    result.when(
      success: (data) {
        _searchStateStore
          ..setNextPage(data.nextPage)
          ..addSearchHits(data.searchHits);
      },
      failure: (error) {},
    );

    return result.isSuccess;
  }
}
