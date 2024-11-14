import 'package:flutter/foundation.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_notifier.g.dart';

@riverpod
class RecipeWindowNotifier extends _$RecipeWindowNotifier {
  static const int _pageSize = kDebugMode ? 5 : 10;
  @override
  int build() => _pageSize;
  void growWindow() => state += _pageSize;
  void resetWindow() => state = _pageSize;
}

class RecipeWindowNotifierMock extends _$RecipeWindowNotifier
    with Mock
    implements RecipeWindowNotifier {
  @override
  int build() => 1;
}
