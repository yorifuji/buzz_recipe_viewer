import 'package:buzz_recipe_viewer/model/search_hit.dart';
import 'package:buzz_recipe_viewer/ui/common/search_hit/video_information_container.dart';
import 'package:flutter/material.dart';

class SearchHitWidget extends StatelessWidget {
  const SearchHitWidget({
    super.key,
    required this.searchHit,
    this.onTapFavorite,
    this.isFavorite = false,
  });

  final SearchHit searchHit;
  final VoidCallback? onTapFavorite;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Image.network(searchHit.image),
            const SizedBox(height: 8),
          ],
        ),
        VideoInformationContainer(
          searchHit: searchHit,
        ),
      ],
    );
  }
}
