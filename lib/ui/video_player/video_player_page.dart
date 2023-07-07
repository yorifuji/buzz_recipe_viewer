import 'package:buzz_recipe_viewer/model/search_hit.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerPage extends StatelessWidget {
  const VideoPlayerPage({super.key, required this.searchHit});

  final SearchHit searchHit;

  @override
  Widget build(BuildContext context) {
    final controller = YoutubePlayerController(
      initialVideoId: searchHit.objectID,
      flags: const YoutubePlayerFlags(
        captionLanguage: 'ja',
      ),
    );
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: YoutubePlayer(
        controller: controller,
        showVideoProgressIndicator: true,
      ),
    );
  }
}
