import 'package:buzz_recipe_viewer/model/favorite.dart';
import 'package:buzz_recipe_viewer/model/search_hit.dart';
import 'package:buzz_recipe_viewer/repository/database_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorite_list_provider.g.dart';

@riverpod
class FavoriteList extends _$FavoriteList {
  Future<List<Favorite>> _fetchFavorite() {
    final databaseRepository = ref.read(databaseRepositoryProvider);
    databaseRepository.watchFavorites(
      onChange: (_) async {
        state = AsyncData(
          await databaseRepository.getFavorites(),
        );
      },
    );
    return databaseRepository.getFavorites();
  }

  @override
  Future<List<Favorite>> build() => _fetchFavorite();

  Future<void> addFavorite(SearchHit searchHit) async => ref
      .read(databaseRepositoryProvider)
      .insertFavorite(Favorite.from(searchHit));

  Future<void> deleteFavorite(Favorite favorite) async =>
      ref.read(databaseRepositoryProvider).deleteFavorite(favorite);
}
