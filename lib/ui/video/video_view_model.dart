import 'package:buzz_recipe_viewer/model/loading_state.dart';
import 'package:buzz_recipe_viewer/model/sort_index.dart';
import 'package:buzz_recipe_viewer/service/video_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'video_view_model.freezed.dart';
part 'video_view_model.g.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    @Default('') String query,
    @Default(SortIndex.timestamp) SortIndex sortType,
    @Default(LoadingState.loadable) LoadingState loadingState,
    @Default(LoadingState.loadable) LoadingState moreLoadingState,
  }) = _SearchState;
}

@riverpod
class SearchViewModel extends _$SearchViewModel {
  late VideoService _videoService;
  @override
  SearchState build() {
    _videoService = ref.watch(videoServiceProvider);
    return const SearchState();
  }

  Future<void> search() async {
    state = state.copyWith(
      loadingState: LoadingState.loading,
    );

    final result =
        await _videoService.getVideoList(state.query, state.sortType);

    state = state.copyWith(
      loadingState: result ? LoadingState.success : LoadingState.failure,
    );
  }

  Future<void> searchMore() async {
    state = state.copyWith(
      moreLoadingState: LoadingState.loading,
    );

    final result = await _videoService.getVideoListMore();

    state = state.copyWith(
      moreLoadingState: result ? LoadingState.success : LoadingState.failure,
    );
  }

  void updateQuery(String query) {
    state = state.copyWith(query: query);
  }

  void updateSortType(SortIndex sortType) {
    state = state.copyWith(sortType: sortType);
  }
}

class FakeSearchViewModel extends _$SearchViewModel
    with Mock
    implements SearchViewModel {
  @override
  SearchState build() => const SearchState();
  @override
  Future<void> search() async {}
}

class FakeErrorSearchViewModel extends _$SearchViewModel
    with Mock
    implements SearchViewModel {
  @override
  SearchState build() => const SearchState(loadingState: LoadingState.failure);
  @override
  Future<void> search() async {}
}
