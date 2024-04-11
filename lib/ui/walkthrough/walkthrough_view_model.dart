import 'package:buzz_recipe_viewer/repository/shared_preferences_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'walkthrough_view_model.freezed.dart';
part 'walkthrough_view_model.g.dart';

@freezed
class WalkthroughState with _$WalkthroughState {
  const factory WalkthroughState({
    @Default(false) bool isShouldShowWalkthrough,
  }) = _WalkthroughState;
}

@riverpod
class WalkthroughViewModel extends _$WalkthroughViewModel {
  @override
  WalkthroughState build() {
    return WalkthroughState(
      isShouldShowWalkthrough: ref
          .watch(sharedPreferencesRepositoryProvider)
          .getShouldShowWalkthrough(),
    );
  }

  void setshouldShowWalkthrough({required bool shouldShowWalkthrough}) {
    ref.read(sharedPreferencesRepositoryProvider).setShouldShowWalkthrough(
          shouldShowWalkthrough: shouldShowWalkthrough,
        );
    state = state.copyWith(isShouldShowWalkthrough: shouldShowWalkthrough);
  }
}
