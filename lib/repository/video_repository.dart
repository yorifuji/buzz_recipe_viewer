import 'package:buzz_recipe_viewer/model/result.dart';
import 'package:buzz_recipe_viewer/model/search_request.dart';
import 'package:buzz_recipe_viewer/model/video_list_result.dart';
import 'package:buzz_recipe_viewer/provider/search_result_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'video_repository.g.dart';

@riverpod
VideoRepository videoRepository(VideoRepositoryRef ref) => VideoRepository(ref);

class VideoRepository {
  VideoRepository(this.ref);
  final Ref ref;

  Future<Result<VideoListResult, Exception>> getVideoList(
    String query,
    String indexName,
    int page,
  ) async {
    try {
      final result = await ref.read(
        searchResultProvider(
          indexName: indexName,
          searchRequest: SearchRequest(query: query, page: page),
        ).future,
      );

      return Result.success(
        data: VideoListResult(
          searchHits: result.hitsPage.items,
          nextPage: result.hitsPage.nextPageKey ?? 0,
        ),
      );
    } catch (e) {
      return Result.failure(error: e as Exception);
    }
  }
}
