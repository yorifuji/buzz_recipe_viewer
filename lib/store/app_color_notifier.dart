import 'package:buzz_recipe_viewer/model/app_color.dart';
import 'package:buzz_recipe_viewer/repository/preference_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_color_notifier.g.dart';

@riverpod
class AppColorNotifer extends _$AppColorNotifer {
  @override
  AppColor build() {
    final appColor =
        ref.watch(stringPreferenceProvider(StringPreferenceKey.appColor));
    return AppColor.fromName(appColor);
  }

  Future<void> update(AppColor appColor) async {
    await ref
        .read(stringPreferenceProvider(StringPreferenceKey.appColor).notifier)
        .update(appColor.name);
    ref.invalidateSelf();
  }
}
