import 'package:buzz_recipe_viewer/model/isar/history.dart';
import 'package:buzz_recipe_viewer/repository/database_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'history_store.g.dart';

@riverpod
class HistoryStore extends _$HistoryStore {
  @override
  List<History> build() {
    final databaseRepository = ref.watch(databaseRepositoryProvider);
    ref.onAddListener(() async {
      state = await databaseRepository.getHistoryList;
    });
    databaseRepository.watchHistorys(
      onChange: (_) async {
        state = await databaseRepository.getHistoryList;
      },
    );
    return [];
  }
}
