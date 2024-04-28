import 'package:buzz_recipe_viewer/provider/shared_preferences_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'preference_repository.g.dart';

enum PreferenceKey<T> {
  // bool
  useInternalPlayer('use_internal_player', true),
  shouldShowWalkthrough('should_show_walkthrough', true),
  // int
  themeMode('theme_mode', 0),
  locale('locale', 0),
  // String
  appColor('app_color', ''),
  // bool?
  // nullableBool('nullable_bool', null),
  ;

  const PreferenceKey(this.key, this.defaultValue);
  final String key;
  final T defaultValue;
}

@riverpod
class PreferenceNotifier<T> extends _$PreferenceNotifier<T> {
  @override
  T build(PreferenceKey<T> keyValue) {
    // return switch (keyValue.defaultValue.runtimeType) {
    //   bool => ref.watch(sharedPreferencesProvider).getBool(keyValue.key) as T ??
    //       keyValue.defaultValue,
    //   String =>
    //     ref.watch(sharedPreferencesProvider).getString(keyValue.key) as T ??
    //         keyValue.defaultValue,
    //   int => ref.watch(sharedPreferencesProvider).getInt(keyValue.key) as T ??
    //       keyValue.defaultValue,
    //   _ => throw UnimplementedError(),
    // };

    if (keyValue.defaultValue is bool) {
      final value = ref.watch(sharedPreferencesProvider).getBool(keyValue.key);
      return value == null ? keyValue.defaultValue : value as T;
    } else if (keyValue.defaultValue is String) {
      final value =
          ref.watch(sharedPreferencesProvider).getString(keyValue.key);
      return value == null ? keyValue.defaultValue : value as T;
    } else if (keyValue.defaultValue is int) {
      final value = ref.watch(sharedPreferencesProvider).getInt(keyValue.key);
      return value == null ? keyValue.defaultValue : value as T;
    } else {
      throw UnimplementedError();
    }
  }

  Future<void> update(T value) async {
    if (value is bool) {
      await ref.read(sharedPreferencesProvider).setBool(keyValue.key, value);
    } else if (value is String) {
      await ref.read(sharedPreferencesProvider).setString(keyValue.key, value);
    } else if (value is int) {
      await ref.read(sharedPreferencesProvider).setInt(keyValue.key, value);
    } else {
      throw UnimplementedError();
    }
    ref.invalidateSelf();
  }
}
