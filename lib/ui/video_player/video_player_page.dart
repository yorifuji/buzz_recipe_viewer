import 'package:buzz_recipe_viewer/model/favorite.dart';
import 'package:buzz_recipe_viewer/model/search_hit.dart';
import 'package:buzz_recipe_viewer/provider/fullscreen_video_playing_state_provider.dart';
import 'package:buzz_recipe_viewer/service/favorite_service.dart';
import 'package:buzz_recipe_viewer/ui/common/search_hit/video_information_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerPage extends HookConsumerWidget {
  const VideoPlayerPage({super.key, required this.searchHit});

  final SearchHit searchHit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final didInitStateDone = useState(false);
    final isMounted = useIsMounted();
    final fullscreenVideoPlayingState =
        ref.watch(fullscreenVideoPlayingStateProvider);

    useEffect(
      () {
        if (isMounted()) {
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

    return fullscreenVideoPlayingState
        ? Scaffold(body: SafeArea(child: _VideoPlayer(searchHit.videoId)))
        : Scaffold(
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
                                child: CircularProgressIndicator(),
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
                      .read(favoriteServiceProvider)
                      .add(Favorite.from(searchHit));
                  // ignore: use_build_context_synchronously
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
      bottomActions: [
        CurrentPosition(),
        ProgressBar(
          isExpanded: true,
        ),
        RemainingDuration(),
        const PlaybackSpeedButton(),
      ],
    );
  }
}
