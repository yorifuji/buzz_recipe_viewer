import 'package:buzz_recipe_viewer/model/favorite.dart';
import 'package:buzz_recipe_viewer/model/history.dart';
import 'package:buzz_recipe_viewer/model/search_hit.dart';
import 'package:buzz_recipe_viewer/repository/database_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'history_page_view_model.freezed.dart';
part 'history_page_view_model.g.dart';

@freezed
class HistoryState with _$HistoryState {
  const factory HistoryState({
    @Default(<History>[]) List<History> histories,
  }) = _HistoryState;
}

@riverpod
class HistoryViewModel extends _$HistoryViewModel {
  late final DatabaseRepository _databaseRepository;
  @override
  HistoryState build() {
    _databaseRepository = ref.watch(databaseRepositoryProvider);
    _databaseRepository.watchHistorys(
      onChange: (_) async {
        final histories = await _databaseRepository.getHistorys();
        state = state.copyWith(histories: histories);
      },
    );

    return const HistoryState();
  }

  Future<void> initialLoad() async {
    final histories = await _databaseRepository.getHistorys();
    state = state.copyWith(histories: histories);
  }

  Future<void> addFavorite(SearchHit searchHit) async {
    await _databaseRepository.insertFavorite(Favorite.from(searchHit));
  }

  // delete history from database
  Future<void> deleteFavorite(History history) async {
    await _databaseRepository.deleteHistory(history);
  }
}
