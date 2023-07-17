import 'package:buzz_recipe_viewer/model/history.dart';
import 'package:buzz_recipe_viewer/repository/database_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'history_service.g.dart';

@riverpod
HistoryService historyService(HistoryServiceRef ref) =>
    HistoryService(ref.watch(databaseRepositoryProvider));

class HistoryService {
  HistoryService(this._databaseRepository);
  final DatabaseRepository _databaseRepository;

  Future<void> add(History history) =>
      _databaseRepository.insertHistory(history);

  Future<void> delete(History history) =>
      _databaseRepository.deleteHistory(history);
}
