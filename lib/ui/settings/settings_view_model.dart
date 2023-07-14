import 'package:buzz_recipe_viewer/repository/shared_preferences_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_view_model.freezed.dart';
part 'settings_view_model.g.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    @Default(false) bool useInternalPlayer,
  }) = _SettingsState;
}

@riverpod
class SettingsViewModel extends _$SettingsViewModel {
  @override
  SettingsState build() {
    return SettingsState(
      useInternalPlayer:
          ref.read(sharedPreferencesRepositoryProvider).getUseInternalPlayer(),
    );
  }

  void setUseInternalPlayer({required bool useInternalPlayer}) {
    ref.read(sharedPreferencesRepositoryProvider).setUseInternalPlayer(
          useInternalPlayer: useInternalPlayer,
        );
    state = state.copyWith(useInternalPlayer: useInternalPlayer);
  }
}
