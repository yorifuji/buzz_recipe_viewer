import 'package:buzz_recipe_viewer/model/favorite.dart';
import 'package:buzz_recipe_viewer/repository/database_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorite_store.g.dart';

@riverpod
class FavoriteStore extends _$FavoriteStore {
  @override
  List<Favorite> build() {
    final databaseRepository = ref.read(databaseRepositoryProvider);
    ref.onAddListener(() async {
      state = await databaseRepository.getFavorites;
    });
    databaseRepository.watchFavorites(
      onChange: (_) async {
        state = await databaseRepository.getFavorites;
      },
    );
    return [];
  }
}
