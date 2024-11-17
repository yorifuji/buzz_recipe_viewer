import 'package:buzz_recipe_viewer/data/repository/firestore/favorite_repository.dart';
import 'package:buzz_recipe_viewer/domain/model/favorite.dart';
import 'package:buzz_recipe_viewer/domain/model/search_hit.dart';
import 'package:buzz_recipe_viewer/i18n/strings.g.dart';
import 'package:buzz_recipe_viewer/ui/common/search_hit/video_information_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerPage extends HookConsumerWidget {
  const VideoPlayerPage({required this.searchHit, super.key});

  final SearchHit searchHit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final didInitStateDone = useState(false);

    useEffect(
      () {
        if (context.mounted) {
          Future.delayed(
              const Duration(
                milliseconds: 500,
              ), () {
            didInitStateDone.value = true;
          });
        }
        return null;
      },
      [],
    );

    return Scaffold(
      body: SafeArea(
        child: InkWell(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    if (didInitStateDone.value)
                      _VideoPlayer(searchHit.videoId)
                    else
                      const AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        ),
                      ),
                    const SizedBox(height: 8),
                  ],
                ),
                VideoInformationContainer(
                  searchHit: searchHit,
                  forceExpanded: true,
                ),
              ],
            ),
          ),
          onLongPress: () async {
            await ref
                .read(favoriteRepositoryProvider)
                .create(Favorite.from(searchHit));
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    t.common.addFavorite,
                    style: const TextStyle(fontSize: 12),
                  ),
                  duration: const Duration(seconds: 1),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class _VideoPlayer extends ConsumerWidget {
  const _VideoPlayer(this.videoId);

  final String videoId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        captionLanguage: 'ja',
      ),
    );

    return YoutubePlayer(
      controller: controller,
      showVideoProgressIndicator: true,
      bottomActions: const [
        CurrentPosition(),
        ProgressBar(
          isExpanded: true,
        ),
        RemainingDuration(),
        PlaybackSpeedButton(),
      ],
    );
  }
}
