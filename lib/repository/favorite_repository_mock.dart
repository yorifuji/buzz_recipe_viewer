import 'package:buzz_recipe_viewer/model/favorite.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorite_repository_mock.g.dart';

@riverpod
Stream<List<Favorite>> emptyFavoriteStream(EmptyFavoriteStreamRef ref) {
  return Stream.value([]);
}
