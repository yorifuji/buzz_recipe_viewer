import 'package:buzz_recipe_viewer/model/history.dart';
import 'package:buzz_recipe_viewer/model/search_hit.dart';
import 'package:buzz_recipe_viewer/repository/database_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'history_list_provider.g.dart';

@riverpod
class HistoryList extends _$HistoryList {
  Future<List<History>> _fetchHistory() {
    final databaseRepository = ref.read(databaseRepositoryProvider);
    databaseRepository.watchHistorys(
      onChange: (_) async {
        state = AsyncData(
          await databaseRepository.getHistorys,
        );
      },
    );
    return databaseRepository.getHistorys;
  }

  @override
  Future<List<History>> build() => _fetchHistory();

  Future<void> addHistory(SearchHit searchHit) => ref
      .read(databaseRepositoryProvider)
      .insertHistory(History.from(searchHit));

  Future<void> deleteHistory(History history) =>
      ref.read(databaseRepositoryProvider).deleteHistory(history);
}
