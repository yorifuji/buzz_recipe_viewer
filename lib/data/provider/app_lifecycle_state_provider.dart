import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_lifecycle_state_provider.g.dart';

@Riverpod(keepAlive: true)
class AppLifecycleNotifier extends _$AppLifecycleNotifier
    with WidgetsBindingObserver {
  @override
  AppLifecycleState build() {
    final binding = WidgetsBinding.instance..addObserver(this);
    ref.onDispose(() => binding.removeObserver(this));
    return AppLifecycleState.resumed;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    this.state = state;
  }
}

extension AppLifecycleStateExt on AppLifecycleState {
  bool get isResumed => this == AppLifecycleState.resumed;
}
