import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_request.freezed.dart';

@freezed
class SearchRequest with _$SearchRequest {
  const factory SearchRequest({
    String? query,
    int? page,
    int? nextPage,
    int? hitsPerPage,
  }) = _SearchRequest;
}
