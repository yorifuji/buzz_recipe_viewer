import 'package:flutter/foundation.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorite_notifier.g.dart';

@riverpod
class FavoriteWindowNotifier extends _$FavoriteWindowNotifier {
  static const int _pageSize = kDebugMode ? 5 : 100;
  @override
  int build() => _pageSize;
  void growWindow() => state += _pageSize;
  void resetWindow() => state = _pageSize;
}

class FavoriteWindowNotifierrMock extends _$FavoriteWindowNotifier
    with Mock
    implements FavoriteWindowNotifier {
  @override
  int build() => 1;
}
