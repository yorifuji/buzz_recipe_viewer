import 'package:buzz_recipe_viewer/domain/model/search_hit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_list_result.freezed.dart';

@freezed
abstract class VideoListResult with _$VideoListResult {
  const factory VideoListResult({
    @Default(<SearchHit>[]) List<SearchHit> searchHits,
    @Default(0) int nextPage,
  }) = _VideoListResult;
}
