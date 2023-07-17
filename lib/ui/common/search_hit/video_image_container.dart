import 'package:buzz_recipe_viewer/model/search_hit.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class VideoImageContainer extends StatelessWidget {
  const VideoImageContainer({
    super.key,
    required this.searchHit,
    this.isLiked = false,
    this.onTap,
    this.onLongPress,
    this.onTapLike,
  });

  final SearchHit searchHit;
  final bool isLiked;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onTapLike;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: onTap,
          onLongPress: onLongPress,
          child: Align(
            child: Column(
              children: [
                Image.network(searchHit.image),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
        if (onTapLike != null)
          Row(
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8),
                child: LikeButton(
                  likeBuilder: (bool isLiked) {
                    return Icon(
                      Icons.favorite,
                      color: isLiked ? Colors.orange : Colors.grey,
                      size: 30,
                    );
                  },
                  isLiked: isLiked,
                  onTap: (isLiked) async {
                    onTapLike?.call(!isLiked);
                    return !isLiked;
                  },
                ),
              ),
            ],
          ),
      ],
    );
  }
}
