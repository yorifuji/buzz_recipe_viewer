import 'package:buzz_recipe_viewer/model/favorite.dart';
import 'package:buzz_recipe_viewer/repository/database_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorites_page_view_model.freezed.dart';
part 'favorites_page_view_model.g.dart';

@freezed
class FavoritesState with _$FavoritesState {
  const factory FavoritesState({
    @Default(<Favorite>[]) List<Favorite> favorites,
  }) = _FavoritesState;
}

@riverpod
class FavoritesViewModel extends _$FavoritesViewModel {
  late final DatabaseRepository _databaseRepository;
  @override
  FavoritesState build() {
    _databaseRepository = ref.read(databaseRepositoryProvider);
    _databaseRepository.watchFavorites(
      onChange: (_) async {
        final favorites = await _databaseRepository.getFavorites();
        state = state.copyWith(favorites: favorites);
      },
    );
    return const FavoritesState();
  }

  Future<void> initialLoad() async {
    final favorites = await _databaseRepository.getFavorites();
    state = state.copyWith(favorites: favorites);
  }

  // delete favorite from database
  Future<void> deleteFavorite(Favorite favorite) async {
    await _databaseRepository.deleteFavorite(favorite);
  }
}
