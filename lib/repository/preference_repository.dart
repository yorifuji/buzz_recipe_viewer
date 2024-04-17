import 'package:buzz_recipe_viewer/provider/shared_preferences_provider.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'preference_repository.g.dart';

enum BoolKey {
  useInternalPlayer('use_internal_player', true),
  shouldShowWalkthrough('should_show_walkthrough', true),
  ;

  // ignore: avoid_positional_boolean_parameters
  const BoolKey(this.key, this.defaultValue);
  final String key;
  final bool defaultValue;
}

enum IntKey {
  themeMode('theme_mode', 0),
  locale('locale', 0),
  ;

  const IntKey(this.key, this.defaultValue);
  final String key;
  final int defaultValue;
}

enum StringKey {
  appColor('app_color', ''),
  ;

  const StringKey(this.key, this.defaultValue);
  final String key;
  final String defaultValue;
}

@riverpod
class BoolPreference extends _$BoolPreference {
  @override
  bool build(BoolKey keyValue) =>
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
  int build(IntKey keyValue) =>
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
  String build(StringKey keyValue) =>
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
  bool build(BoolKey keyValue) => true;
}

class FakeFalsePreference extends _$BoolPreference
    with Mock
    implements BoolPreference {
  @override
  bool build(BoolKey keyValue) => false;
}

class FakeIntPreference extends _$IntPreference
    with Mock
    implements IntPreference {
  FakeIntPreference({required this.value});

  // ignore: avoid_public_notifier_properties
  final int value;
  @override
  int build(IntKey keyValue) => value;
}
