import 'package:buzz_recipe_viewer/provider/shared_preferences_provider.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'preference_repository.g.dart';

enum BoolPreferenceKey {
  useInternalPlayer('use_internal_player', true),
  shouldShowWalkthrough('should_show_walkthrough', true),
  ;

  // ignore: avoid_positional_boolean_parameters
  const BoolPreferenceKey(this.key, this.defaultValue);
  final String key;
  final bool defaultValue;
}

enum IntPreferenceKey {
  themeMode('theme_mode', 0),
  locale('locale', 0),
  ;

  const IntPreferenceKey(this.key, this.defaultValue);
  final String key;
  final int defaultValue;
}

enum StringPreferenceKey {
  appColor('app_color', ''),
  ;

  const StringPreferenceKey(this.key, this.defaultValue);
  final String key;
  final String defaultValue;
}

@riverpod
class BoolPreference extends _$BoolPreference {
  @override
  bool build(BoolPreferenceKey keyValue) =>
      ref.watch(sharedPreferencesProvider).getBool(keyValue.key) ??
      keyValue.defaultValue;

  // ignore: avoid_positional_boolean_parameters
  Future<void> update(bool value) async {
    await ref.read(sharedPreferencesProvider).setBool(keyValue.key, value);
    ref.invalidateSelf();
  }
}

@riverpod
class IntPreference extends _$IntPreference {
  @override
  int build(IntPreferenceKey keyValue) =>
      ref.watch(sharedPreferencesProvider).getInt(keyValue.key) ??
      keyValue.defaultValue;

  Future<void> update(int value) async {
    await ref.read(sharedPreferencesProvider).setInt(keyValue.key, value);
    ref.invalidateSelf();
  }
}

@riverpod
class StringPreference extends _$StringPreference {
  @override
  String build(StringPreferenceKey keyValue) =>
      ref.watch(sharedPreferencesProvider).getString(keyValue.key) ??
      keyValue.defaultValue;

  Future<void> update(String value) async {
    await ref.read(sharedPreferencesProvider).setString(keyValue.key, value);
    ref.invalidateSelf();
  }
}

class FakeTruePreference extends _$BoolPreference
    with Mock
    implements BoolPreference {
  @override
  bool build(BoolPreferenceKey keyValue) => true;
}

class FakeFalsePreference extends _$BoolPreference
    with Mock
    implements BoolPreference {
  @override
  bool build(BoolPreferenceKey keyValue) => false;
}

class FakeIntPreference extends _$IntPreference
    with Mock
    implements IntPreference {
  FakeIntPreference({required this.value});

  // ignore: avoid_public_notifier_properties
  final int value;
  @override
  int build(IntPreferenceKey keyValue) => value;
}
