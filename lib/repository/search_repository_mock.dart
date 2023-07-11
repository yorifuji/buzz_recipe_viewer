import 'package:buzz_recipe_viewer/model/result.dart';
import 'package:buzz_recipe_viewer/model/search_hit.dart';
import 'package:buzz_recipe_viewer/model/search_result.dart';
import 'package:buzz_recipe_viewer/repository/search_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_repository_mock.g.dart';

@riverpod
MockSearchRepository mockSearchRepository(MockSearchRepositoryRef ref) =>
    MockSearchRepository();

class MockSearchRepository implements SearchRepository {
  @override
  Future<Result<SearchResult>> search(
    String query,
    String indexName,
    int page,
  ) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return Result.success(
      data: SearchResult(
        searchHits: List.generate(
          10,
          (index) => SearchHit(
            id: 'id${index + page}',
            title: '【テストデータ${index + page}】タイトルタイトルタイトルタイトルタイトルタイトルタイトル',
            description:
                '説明が入ります\nhttps://github.com/yorifuji/buzz_recipe_viewer',
            published: '',
            timestamp: 0,
            views: 12345,
            likes: 12345,
            image:
                'https://yorifuji.github.io/public/images/video_dummy_image.00${index % 2}.png',
            objectID: 'B2D3lGOrdVQ',
            url: 'https://www.youtube.com/embed/B2D3lGOrdVQ',
          ),
        ),
        nextPage: page + 10,
      ),
    );
  }
}
