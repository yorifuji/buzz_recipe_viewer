import 'package:buzz_recipe_viewer/model/search_hit.dart';
import 'package:buzz_recipe_viewer/ui/video_player/video_player_view_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerPage extends ConsumerWidget {
  const VideoPlayerPage({super.key, required this.searchHit});

  final SearchHit searchHit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(videoPlayerViewModelProvider.notifier);
    final controller = YoutubePlayerController(
      initialVideoId: searchHit.objectID,
      flags: const YoutubePlayerFlags(
        captionLanguage: 'ja',
      ),
    );
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.only(top: 32),
        child: YoutubePlayer(
          controller: controller,
          showVideoProgressIndicator: true,
        ),
      ),
      onLongPress: () {
        viewModel.addFavorite(searchHit);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'お気に入りに追加しました',
              style: TextStyle(fontSize: 12),
            ),
            duration: Duration(seconds: 1),
          ),
        );
      },
    );
  }
}
