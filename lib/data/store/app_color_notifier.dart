import 'package:buzz_recipe_viewer/data/provider/preference_provider.dart';
import 'package:buzz_recipe_viewer/domain/model/app_color.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_color_notifier.g.dart';

@riverpod
class AppColorNotifer extends _$AppColorNotifer {
  @override
  AppColor build() {
    final appColor = ref.watch(stringPreferenceProvider(Preference.appColor));
    return AppColor.fromName(appColor);
  }

  Future<void> update(AppColor appColor) async {
    await ref
        .read(stringPreferenceProvider(Preference.appColor).notifier)
        .update(appColor.name);
    ref.invalidateSelf();
  }
}
