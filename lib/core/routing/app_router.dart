import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:grap/core/constants/app_constants.dart';
import 'package:grap/features/auth/presentation/pages/login_page.dart';
import 'package:grap/features/auth/presentation/pages/sign_up_page.dart';
import 'package:grap/features/studio/presentation/pages/content_generation_page.dart';
import 'package:grap/features/studio/presentation/pages/free_mode_page.dart';
import 'package:grap/features/studio/presentation/pages/history_page.dart';
import 'package:grap/features/studio/presentation/pages/home_page.dart';
import 'package:grap/features/studio/presentation/pages/image_generation_page.dart';
import 'package:grap/features/studio/presentation/pages/post_generation_page.dart';
import 'package:grap/features/studio/presentation/pages/profile_settings_page.dart';
import 'package:grap/features/studio/presentation/pages/social_links_page.dart';
import 'package:grap/features/studio/presentation/pages/subscriptions_page.dart';
import 'package:grap/features/studio/presentation/pages/usage_billing_page.dart';
import 'package:grap/features/studio/presentation/shell/main_shell.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppConstants.loginRoute,
    routes: [
      GoRoute(
        path: AppConstants.loginRoute,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: AppConstants.signUpRoute,
        builder: (context, state) => const SignUpPage(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            MainShell(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppConstants.homeRoute,
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppConstants.historyRoute,
                builder: (context, state) => const HistoryPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppConstants.socialRoute,
                builder: (context, state) => const SocialLinksPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppConstants.profileRoute,
                builder: (context, state) => const ProfileSettingsPage(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppConstants.contentGenerationRoute,
        builder: (context, state) => const ContentGenerationPage(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppConstants.imageGenerationRoute,
        builder: (context, state) => const ImageGenerationPage(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppConstants.postGenerationRoute,
        builder: (context, state) => const PostGenerationPage(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppConstants.usageBillingRoute,
        builder: (context, state) => const UsageBillingPage(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppConstants.subscriptionsRoute,
        builder: (context, state) => const SubscriptionsPage(),
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppConstants.freeModeRoute,
        builder: (context, state) => const FreeModePage(),
      ),
    ],
  );
});
