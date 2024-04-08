import 'package:buzz_recipe_viewer/provider/theme_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';

class CustomSettingsList extends ConsumerWidget {
  const CustomSettingsList({
    required this.sections,
    this.shrinkWrap = false,
    this.physics,
    this.platform,
    this.lightTheme,
    this.darkTheme,
    this.brightness,
    this.contentPadding,
    this.applicationType = ApplicationType.material,
    super.key,
  });

  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final DevicePlatform? platform;
  final SettingsThemeData? lightTheme;
  final SettingsThemeData? darkTheme;
  final Brightness? brightness;
  final EdgeInsetsGeometry? contentPadding;
  final List<AbstractSettingsSection> sections;
  final ApplicationType applicationType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final light = ref.watch(themeDataProvider());
    final dark = ref.watch(themeDataProvider(isDarkMode: true));

    return SettingsList(
      sections: sections,
      shrinkWrap: shrinkWrap,
      physics: physics,
      platform: platform,
      lightTheme: SettingsThemeData(
        settingsSectionBackground: light.cardColor,
        settingsListBackground: light.scaffoldBackgroundColor,
      ).merge(theme: lightTheme),
      darkTheme: SettingsThemeData(
        settingsSectionBackground: dark.cardColor,
        settingsListBackground: dark.scaffoldBackgroundColor,
      ).merge(theme: darkTheme),
      brightness: brightness,
      contentPadding: contentPadding,
      applicationType: applicationType,
    );
  }
}
