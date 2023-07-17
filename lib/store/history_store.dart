import 'package:buzz_recipe_viewer/model/history.dart';
import 'package:buzz_recipe_viewer/repository/database_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'history_store.g.dart';

@riverpod
class HistoryStore extends _$HistoryStore {
  @override
  List<History> build() {
    final databaseRepository = ref.read(databaseRepositoryProvider);
    ref.onAddListener(() async {
      state = await databaseRepository.getHistorys;
    });
    databaseRepository.watchHistorys(
      onChange: (_) async {
        state = await databaseRepository.getHistorys;
      },
    );
    return [];
  }
}
