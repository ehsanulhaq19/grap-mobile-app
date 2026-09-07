import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:grap/core/widgets/app_bottom_nav.dart';
import 'package:grap/core/widgets/glass_app_bar.dart';

class MainShell extends StatelessWidget {
  const MainShell({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: AppBottomNav(
        currentIndex: navigationShell.currentIndex,
        onTap: navigationShell.goBranch,
      ),
    );
  }
}

class StudioScaffold extends StatelessWidget {
  const StudioScaffold({
    required this.body,
    super.key,
    this.appBarVariant = AppBarVariant.standard,
    this.appBarTitle,
    this.showCredits = true,
    this.showAvatar = true,
    this.onBack,
    this.bottom,
  });

  final Widget body;
  final AppBarVariant appBarVariant;
  final String? appBarTitle;
  final bool showCredits;
  final bool showAvatar;
  final VoidCallback? onBack;
  final Widget? bottom;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlassAppBar(
        variant: appBarVariant,
        title: appBarTitle,
        showCredits: showCredits,
        showAvatar: showAvatar,
        onBack: onBack,
      ),
      body: body,
      bottomNavigationBar: bottom,
    );
  }
}
