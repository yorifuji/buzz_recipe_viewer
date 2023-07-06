import 'package:buzz_recipe_viewer/model/history.dart';
import 'package:buzz_recipe_viewer/repository/database_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'histories_page_view_model.freezed.dart';
part 'histories_page_view_model.g.dart';

@freezed
class HistoriesState with _$HistoriesState {
  const factory HistoriesState({
    @Default(<History>[]) List<History> histories,
  }) = _HistoriesState;
}

@riverpod
class HistoriesViewModel extends _$HistoriesViewModel {
  late final DatabaseRepository _databaseRepository;
  @override
  HistoriesState build() {
    _databaseRepository = ref.read(databaseRepositoryProvider);
    _databaseRepository.watchHistorys(
      onChange: (_) async {
        final histories = await _databaseRepository.getHistorys();
        state = state.copyWith(histories: histories);
      },
    );

    return const HistoriesState();
  }

  Future<void> initialLoad() async {
    final histories = await _databaseRepository.getHistorys();
    state = state.copyWith(histories: histories);
  }

  // delete history from database
  Future<void> deleteFavorite(History history) async {
    await _databaseRepository.deleteHistory(history);
  }
}
