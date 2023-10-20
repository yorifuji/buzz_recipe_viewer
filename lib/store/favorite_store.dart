import 'package:buzz_recipe_viewer/model/isar/favorite.dart';
import 'package:buzz_recipe_viewer/repository/database_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorite_store.g.dart';

@Riverpod(dependencies: [])
class FavoriteStore extends _$FavoriteStore {
  @override
  List<Favorite> build() {
    final databaseRepository = ref.watch(databaseRepositoryProvider);
    ref.onAddListener(() async {
      state = await databaseRepository.getFavoriteList;
    });
    databaseRepository.watchFavorites(
      onChange: (_) async {
        state = await databaseRepository.getFavoriteList;
      },
    );
    return [];
  }
}
