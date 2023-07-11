import 'package:buzz_recipe_viewer/model/favorite.dart';
import 'package:buzz_recipe_viewer/model/search_hit.dart';
import 'package:buzz_recipe_viewer/repository/database_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'video_player_view_model.g.dart';

@riverpod
class VideoPlayerViewModel extends _$VideoPlayerViewModel {
  late final DatabaseRepository _databaseRepository;
  @override
  void build() {
    _databaseRepository = ref.watch(databaseRepositoryProvider);
  }

  Future<void> addFavorite(SearchHit searchHit) async {
    await _databaseRepository.insertFavorite(Favorite.from(searchHit));
  }
}
