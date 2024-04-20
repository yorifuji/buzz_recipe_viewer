import 'package:buzz_recipe_viewer/model/app_color.dart';
import 'package:buzz_recipe_viewer/repository/preference_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_color_notifier.g.dart';

@riverpod
class AppColorNotifer extends _$AppColorNotifer {
  @override
  AppColor build() {
    final appColor =
        ref.watch(preferenceNotifierProvider(PreferenceKeys.appColor));
    // final nullableValue = ref
    //     .watch(preferenceNotifierProvider<bool?>(PreferenceKeys.nullableBool));
    return AppColor.fromName(appColor);
  }

  Future<void> update(AppColor appColor) async {
    await ref
        .read(preferenceNotifierProvider(PreferenceKeys.appColor).notifier)
        .update(appColor.name);
    // await ref
    //     .read(
    //       preferenceNotifierProvider<bool?>(PreferenceKeys.nullableBool)
    //           .notifier,
    //     )
    //     .update(null);
    ref.invalidateSelf();
  }
}
