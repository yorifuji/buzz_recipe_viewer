import 'package:buzz_recipe_viewer/ui/histories/histories_page_view_model.dart';
import 'package:buzz_recipe_viewer/ui/search_hit/search_hit_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class HistoriesPage extends HookConsumerWidget {
  const HistoriesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(historiesViewModelProvider.notifier);
    final histories = ref
        .watch(historiesViewModelProvider.select((value) => value.histories));
    useEffect(
      () {
        Future.microtask(viewModel.initialLoad);
        return null;
      },
      const [],
    );

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: histories
                .map(
                  (e) => Dismissible(
                    key: UniqueKey(),
                    child: InkWell(
                      child: SearchHitWidget(searchHit: e.searchHit),
                      onTap: () async {
                        final url = Uri.parse(e.searchHit.url);
                        if (await launchUrl(
                          url,
                          mode: LaunchMode.externalApplication,
                        )) {
                        } else {
                          // FIXME:
                          // ignore: only_throw_errors
                          throw 'Could not launch $url';
                        }
                      },
                    ),
                    onDismissed: (direction) {
                      viewModel.deleteFavorite(e);
                    },
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
