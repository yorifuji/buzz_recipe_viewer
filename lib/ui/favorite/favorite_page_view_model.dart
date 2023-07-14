import 'package:buzz_recipe_viewer/model/favorite.dart';
import 'package:buzz_recipe_viewer/repository/database_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorite_page_view_model.g.dart';

@riverpod
class FavoriteViewModel extends _$FavoriteViewModel {
  late DatabaseRepository _databaseRepository;
  @override
  List<Favorite> build() {
    _databaseRepository = ref.watch(databaseRepositoryProvider);
    _databaseRepository.watchFavorites(
      onChange: (_) async {
        state = await _databaseRepository.getFavorites();
      },
    );
    return [];
  }

  Future<void> initialLoad() async {
    state = await _databaseRepository.getFavorites();
  }

  // delete favorite from database
  Future<void> deleteFavorite(Favorite favorite) async {
    await _databaseRepository.deleteFavorite(favorite);
  }
}
