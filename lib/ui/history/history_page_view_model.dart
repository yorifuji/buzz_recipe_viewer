import 'package:buzz_recipe_viewer/model/favorite.dart';
import 'package:buzz_recipe_viewer/model/history.dart';
import 'package:buzz_recipe_viewer/model/search_hit.dart';
import 'package:buzz_recipe_viewer/repository/database_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'history_page_view_model.g.dart';

@riverpod
class HistoryViewModel extends _$HistoryViewModel {
  late DatabaseRepository _databaseRepository;
  @override
  List<History> build() {
    _databaseRepository = ref.watch(databaseRepositoryProvider);
    _databaseRepository.watchHistorys(
      onChange: (_) async {
        state = await _databaseRepository.getHistorys();
      },
    );
    return [];
  }

  Future<void> initialLoad() async {
    state = await _databaseRepository.getHistorys();
  }

  Future<void> addFavorite(SearchHit searchHit) async {
    await _databaseRepository.insertFavorite(Favorite.from(searchHit));
  }

  Future<void> deleteFavorite(History history) async {
    await _databaseRepository.deleteHistory(history);
  }
}
