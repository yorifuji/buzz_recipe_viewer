enum RemoteConfigSetting<T> {
  isMaintenance<bool>('is_maintenance', false),
  ;

  const RemoteConfigSetting(this.key, this.defaultValue);

  final String key;
  final T defaultValue;

  static Map<String, dynamic> allKeyAndDefaults() => {
        for (final config in RemoteConfigSetting.values)
          config.key: config.defaultValue,
      };
}
