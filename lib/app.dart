import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:grap/core/constants/app_constants.dart';
import 'package:grap/core/routing/app_router.dart';
import 'package:grap/core/theme/app_theme.dart';

class GrapApp extends ConsumerWidget {
  const GrapApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: AppConstants.appName,
      theme: AppTheme.light,
      routerConfig: router,
    );
  }
}
