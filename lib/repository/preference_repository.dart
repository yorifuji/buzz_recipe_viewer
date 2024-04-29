import 'package:buzz_recipe_viewer/provider/shared_preferences_provider.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'preference_repository.g.dart';

enum Preference<T> {
  // bool
  useInternalPlayer('use_internal_player', true),
  shouldShowWalkthrough('should_show_walkthrough', true),
  // int
  themeMode('theme_mode', 0),
  locale('locale', 0),
  // String
  appColor('app_color', ''),
  ;

  const Preference(this.key, this.defaultValue);
  final String key;
  final T defaultValue;
}

@riverpod
class BoolPreference extends _$BoolPreference {
  @override
  bool build(Preference<bool> pref) =>
      ref.read(sharedPreferencesProvider).getBool(pref.key) ??
      pref.defaultValue;

  // ignore: avoid_positional_boolean_parameters
  Future<void> update(bool value) async {
    await ref.read(sharedPreferencesProvider).setBool(pref.key, value);
    ref.invalidateSelf();
  }
}

@riverpod
class IntPreference extends _$IntPreference {
  @override
  int build(Preference<int> pref) =>
      ref.read(sharedPreferencesProvider).getInt(pref.key) ?? pref.defaultValue;

  Future<void> update(int value) async {
    await ref.read(sharedPreferencesProvider).setInt(pref.key, value);
    ref.invalidateSelf();
  }
}

@riverpod
class StringPreference extends _$StringPreference {
  @override
  String build(Preference<String> pref) =>
      ref.read(sharedPreferencesProvider).getString(pref.key) ??
      pref.defaultValue;

  Future<void> update(String value) async {
    await ref.read(sharedPreferencesProvider).setString(pref.key, value);
    ref.invalidateSelf();
  }
}

class FakeTruePreference extends _$BoolPreference
    with Mock
    implements BoolPreference {
  @override
  bool build(Preference<bool> pref) => true;
}

class FakeFalsePreference extends _$BoolPreference
    with Mock
    implements BoolPreference {
  @override
  bool build(Preference<bool> pref) => false;
}

class FakeIntPreference extends _$IntPreference
    with Mock
    implements IntPreference {
  FakeIntPreference({required this.value});

  // ignore: avoid_public_notifier_properties
  final int value;
  @override
  int build(Preference<int> pref) => value;
}
