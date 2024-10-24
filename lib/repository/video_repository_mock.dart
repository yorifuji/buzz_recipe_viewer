import 'package:buzz_recipe_viewer/model/result.dart';
import 'package:buzz_recipe_viewer/model/search_hit.dart';
import 'package:buzz_recipe_viewer/model/video_list_result.dart';
import 'package:buzz_recipe_viewer/repository/video_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'video_repository_mock.g.dart';

@riverpod
VideoRepositoryMock videoRepositoryMock(Ref ref) => VideoRepositoryMock();

class VideoRepositoryMock implements VideoRepository {
  @override
  Future<Result<VideoListResult, Exception>> getVideoList(
    String query,
    String indexName,
    int page,
  ) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return Result.success(
      data: VideoListResult(
        searchHits: List.generate(
          10,
          (index) => SearchHit(
            id: 'id${index + page}',
            videoId: 'B2D3lGOrdVQ',
            title: '【ダミーデータ】一度食べたら忘れられない！家庭で作れる究極の美味しさ、超・至高の唐揚げレシピ',
            description: '動画を見て楽しんで頂けましたら\n'
                '高評価、コメントをお願いします！\n'
                '\n'
                '【超・至高の唐揚げ】\n'
                '是非お試しください！\n'
                '\n'
                '大賞受賞しました！ありがとうございます！\n'
                '★2022年第9回レシピ本大賞　料理部門・大賞★\n'
                '\n'
                '★今回のレシピはこちら↓\n'
                'ーーーーーーーーーーーーーー\n'
                '【超・至高の唐揚げ】\n'
                '鶏もも肉...1枚(350g)\n'
                'にんにく...1片\n'
                '生姜...5g\n'
                '醤油...大さじ3\n'
                'みりん...大さじ1\n'
                '酒...大さじ1\n'
                '味の素...8振り\n'
                'ナツメグ...5振り\n'
                'オールスパイス...4振り\n'
                'クミン...2振り\n'
                'パウダー黒胡椒...4振り\n'
                'サラダ油...底1cmぐらいの量\n'
                '片栗粉...適量\n'
                '☆カットレモンを添えて\n'
                'ーーーーーーーーーーーーーー\n',
            published: '',
            timestamp: DateTime.now().millisecondsSinceEpoch ~/ 1000,
            views: 12345,
            likes: 12345,
            image:
                'https://yorifuji.github.io/public/images/video_dummy_image.00${index % 2}.png',
            url: 'https://www.youtube.com/embed/B2D3lGOrdVQ',
          ),
        ),
        nextPage: page + 10,
      ),
    );
  }

  @override
  Ref<Object?> get ref => throw UnimplementedError();
}
