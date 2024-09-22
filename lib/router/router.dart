import 'package:buzz_recipe_viewer/model/remote_config_settings.dart';
import 'package:buzz_recipe_viewer/provider/remoteconfig_provider.dart';
import 'package:buzz_recipe_viewer/provider/user_stream_provider.dart';
import 'package:buzz_recipe_viewer/repository/preference_repository.dart';
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
}

@riverpod
GoRouter router(RouterRef ref) {
  final shouldShowWalkthrough = ref.watch(
    boolPreferenceProvider(Preference.shouldShowWalkthrough),
  );
  final shouldProvisioning = ref.watch(
    boolPreferenceProvider(Preference.shouldProvisioning),
  );
  final userStream = ref.watch(userStreamProvider);
  final isMaintenance =
      ref.watch(boolRemoteConfigProvider(RemoteConfigSetting.isMaintenance));

  return GoRouter(
    debugLogDiagnostics: kDebugMode,
    initialLocation: Route.walkthrough.path,
    observers: [
      FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
    ],
    routes: [
      GoRoute(
        path: Route.walkthrough.path,
        name: Route.walkthrough.path,
        builder: (context, state) => const WalkthroughPage(),
      ),
      GoRoute(
        path: Route.provisoning.path,
        name: Route.provisoning.path,
        builder: (context, state) => const ProvisioningPage(),
      ),
      GoRoute(
        path: Route.navigation.path,
        name: Route.navigation.path,
        builder: (context, state) => const NavigationPage(),
      ),
      GoRoute(
        path: Route.maintenance.path,
        name: Route.maintenance.path,
        builder: (context, state) => const MaintenancePage(),
      ),
    ],
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
