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
  late final SharedPreferencesRepository _sharedPreferencesRepository;
  @override
  SettingsState build() {
    _sharedPreferencesRepository =
        ref.read(sharedPreferencesRepositoryProvider);
    return SettingsState(
      useInternalPlayer: _sharedPreferencesRepository.getUseInternalPlayer(),
    );
  }

  void setUseInternalPlayer({required bool useInternalPlayer}) {
    _sharedPreferencesRepository.setUseInternalPlayer(
      useInternalPlayer: useInternalPlayer,
    );
    state = state.copyWith(useInternalPlayer: useInternalPlayer);
  }
}
