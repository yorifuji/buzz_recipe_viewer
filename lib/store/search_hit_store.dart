// ignore_for_file: use_setters_to_change_properties

import 'package:buzz_recipe_viewer/model/search_hit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_hit_store.g.dart';

@riverpod
class SearchHitStore extends _$SearchHitStore {
  @override
  List<SearchHit> build() => [];

  // add searchHit list
  void add(List<SearchHit> hitList) => state = [...state, ...hitList];

  // set
  void set(List<SearchHit> hitList) => state = hitList;
}
