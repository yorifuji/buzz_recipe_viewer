import 'dart:io';

import 'package:buzz_recipe_viewer/repository/shared_preferences_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mockito/mockito.dart';
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
      useInternalPlayer: !(kIsWeb || Platform.isMacOS) &&
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

class FakeSettingsViewModel extends _$SettingsViewModel
    with Mock
    implements SettingsViewModel {
  @override
  SettingsState build() => const SettingsState();
}
