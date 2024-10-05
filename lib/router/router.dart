import 'package:buzz_recipe_viewer/model/remote_config_settings.dart';
import 'package:buzz_recipe_viewer/provider/preference_provider.dart';
import 'package:buzz_recipe_viewer/provider/remote_config_provider.dart';
import 'package:buzz_recipe_viewer/provider/user_stream_provider.dart';
import 'package:buzz_recipe_viewer/ui/maintenance/maintenance_page.dart';
import 'package:buzz_recipe_viewer/ui/navigation/navigation_page.dart';
import 'package:buzz_recipe_viewer/ui/provisioning/provisioning_page.dart';
import 'package:buzz_recipe_viewer/ui/walkthrough/walkthrough_page.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

enum Route {
  maintenance('/maintenance'),
  walkthrough('/walkthrough'),
  provisoning('/provisioning'),
  navigation('/'),
  ;

  const Route(this.path);
  final String path;

  GoRoute get toGoRoute => switch (this) {
        Route.maintenance => GoRoute(
            path: path,
            name: path,
            builder: (_, __) => const MaintenancePage(),
          ),
        Route.walkthrough => GoRoute(
            path: path,
            name: path,
            builder: (_, __) => const WalkthroughPage(),
          ),
        Route.provisoning => GoRoute(
            path: path,
            name: path,
            builder: (_, __) => const ProvisioningPage(),
          ),
        Route.navigation => GoRoute(
            path: path,
            name: path,
            builder: (_, __) => const NavigationPage(),
          ),
      };
}

@riverpod
GoRouter router(RouterRef ref) {
  final isMaintenance =
      ref.watch(boolRemoteConfigProvider(RemoteConfigSetting.isMaintenance));
  final shouldShowWalkthrough = ref.watch(
    boolPreferenceProvider(Preference.shouldShowWalkthrough),
  );
  final shouldProvisioning = ref.watch(
    boolPreferenceProvider(Preference.shouldProvisioning),
  );
  final userStream = ref.watch(userStreamProvider);

  return GoRouter(
    debugLogDiagnostics: kDebugMode,
    initialLocation: Route.walkthrough.path,
    observers: [
      FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
    ],
    routes: Route.values.map((route) => route.toGoRoute).toList(),
    redirect: (BuildContext context, GoRouterState state) {
      if (isMaintenance) {
        return Route.maintenance.path;
      } else if (shouldShowWalkthrough) {
        return Route.walkthrough.path;
      } else if (shouldProvisioning || userStream.value == null) {
        return Route.provisoning.path;
      } else {
        return Route.navigation.path;
      }
    },
  );
}
