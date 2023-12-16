import 'package:buzz_recipe_viewer/ui/settings/settings_view_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fake_settings_view_model.g.dart';

@riverpod
class FakeSettingsViewModel extends _$FakeSettingsViewModel
    implements SettingsViewModel {
  @override
  SettingsState build() => const SettingsState();

  @override
  void setUseInternalPlayer({required bool useInternalPlayer}) {}
}
