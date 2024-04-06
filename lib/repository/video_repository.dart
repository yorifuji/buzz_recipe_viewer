import 'package:algolia/algolia.dart';
import 'package:buzz_recipe_viewer/model/result.dart';
import 'package:buzz_recipe_viewer/model/search_hit.dart';
import 'package:buzz_recipe_viewer/model/video_list_result.dart';
import 'package:buzz_recipe_viewer/provider/algolia_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'video_repository.g.dart';

@riverpod
VideoRepository videoRepository(VideoRepositoryRef ref) =>
    VideoRepository(ref.watch(algoliaProvider));

class VideoRepository {
  VideoRepository(this._algoliaClient);
  final Algolia _algoliaClient;

  Future<Result<VideoListResult>> getVideoList(
    String query,
    String indexName,
    int page,
  ) async {
    return Result.guardFuture(() async {
      try {
        final algoliaQuery = _algoliaClient
            .index(indexName)
            .setHitsPerPage(30)
            .setPage(page)
            .query(query);
        final snapshot = await algoliaQuery.getObjects();
        final searchHits =
            snapshot.hits.map((e) => SearchHit.fromJson(e.toMap())).toList();
        final nextPage =
            snapshot.page + 1 < snapshot.nbPages ? snapshot.page + 1 : 0;
        return VideoListResult(searchHits: searchHits, nextPage: nextPage);
        // ignore: avoid_catches_without_on_clauses
      } catch (_) {
        throw Exception(); // FIXME: use error
      }
    });
  }
}
