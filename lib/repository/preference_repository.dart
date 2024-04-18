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

// enum PreferenceKeys<T> {
//   // bool
//   useInternalPlayer('use_internal_player', true),
//   shouldShowWalkthrough('should_show_walkthrough', true),
//   // int
//   themeMode('theme_mode', 0),
//   locale('locale', 0),
//   // String
//   appColor('app_color', ''),
//   ;

//   const PreferenceKeys(this.key, this.defaultValue);
//   final String key;
//   final T defaultValue;
// }

// class PreferenceKey<T> {
//   const PreferenceKey(this.key, this.defaultValue);
//   final String key;
//   final T defaultValue;
// }

// class PreferenceKeys {
//   static const useInternalPlayer =
//       PreferenceKey<bool>('use_internal_player', true);
//   static const shouldShowWalkthrough =
//       PreferenceKey<bool>('should_show_walkthrough', true);
//   static const themeMode = PreferenceKey<int>('theme_mode', 0);
//   static const locale = PreferenceKey<int>('locale', 0);
//   static const appColor = PreferenceKey<String>('app_color', '');
//   // dummy
//   static const nullableBool = PreferenceKey<bool?>('nullable_bool', null);
// }

// @riverpod
// class PreferenceNotifier<T> extends _$PreferenceNotifier {
//   @override
//   T build(PreferenceKey<T> keyValue) {
//     if (keyValue.defaultValue is bool) {
//       final value = ref.watch(sharedPreferencesProvider).getBool(keyValue.key);
//       return value as T ?? keyValue.defaultValue;
//     } else if (keyValue.defaultValue is String) {
//       final value =
//           ref.watch(sharedPreferencesProvider).getString(keyValue.key);
//       return value as T ?? keyValue.defaultValue;
//     } else if (keyValue.defaultValue is int) {
//       final value = ref.watch(sharedPreferencesProvider).getInt(keyValue.key);
//       return value as T ?? keyValue.defaultValue;
//     } else {
//       throw UnimplementedError();
//     }
//   }

//   Future<void> update(T value) async {
//     if (value is bool) {
//       await ref.read(sharedPreferencesProvider).setBool(keyValue.key, value);
//     } else if (value is String) {
//       await ref.read(sharedPreferencesProvider).setString(keyValue.key, value);
//     } else if (value is int) {
//       await ref.read(sharedPreferencesProvider).setInt(keyValue.key, value);
//     } else {
//       throw UnimplementedError();
//     }
//     ref.invalidateSelf();
//   }
// }
