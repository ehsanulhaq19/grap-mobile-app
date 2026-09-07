import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:grap/core/theme/app_colors.dart';
import 'package:grap/core/theme/app_spacing.dart';
import 'package:grap/core/theme/app_typography.dart';
import 'package:grap/core/widgets/grap_logo.dart';
import 'package:grap/core/widgets/credits_badge.dart';
import 'package:grap/core/widgets/icon_action_button.dart';
import 'package:grap/features/studio/presentation/providers/studio_providers.dart';

enum AppBarVariant { standard, back, profile }

class GlassAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GlassAppBar({
    super.key,
    this.variant = AppBarVariant.standard,
    this.title,
    this.showCredits = true,
    this.showAvatar = true,
    this.onBack,
    this.trailing,
  });

  final AppBarVariant variant;
  final String? title;
  final bool showCredits;
  final bool showAvatar;
  final VoidCallback? onBack;
  final Widget? trailing;

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface.withValues(alpha: 0.8),
        boxShadow: [
          BoxShadow(
            color: AppColors.ambientShadow.withValues(alpha: 0.5),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.containerMargin,
            vertical: AppSpacing.md,
          ),
          child: Row(
            children: [
              Expanded(child: _buildLeading(context)),
              if (showCredits && variant != AppBarVariant.back) ...[
                CreditsBadge(
                  onTap: () => Navigator.maybeOf(context),
                ),
              ] else if (trailing != null)
                trailing!,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLeading(BuildContext context) {
    switch (variant) {
      case AppBarVariant.back:
        return Row(
          children: [
            IconActionButton(
              icon: Icons.arrow_back,
              onPressed: onBack ?? () => Navigator.of(context).maybePop(),
            ),
            if (title != null) ...[
              const SizedBox(width: AppSpacing.xs),
              Text(
                title!,
                style: AppTypography.headlineMd.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ] else
              const GrapLogo(size: GrapLogoSize.small),
            const Spacer(),
            if (showCredits) const CreditsBadge(),
            if (showAvatar) ...[
              const SizedBox(width: AppSpacing.sm),
              _Avatar(),
            ],
          ],
        );
      case AppBarVariant.profile:
        return Text(
          title ?? 'Profile',
          style: AppTypography.headlineLgMobile.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        );
      case AppBarVariant.standard:
        return Row(
          children: [
            if (showAvatar) ...[
              _Avatar(),
              const SizedBox(width: AppSpacing.sm),
            ],
            const GrapLogo(size: GrapLogoSize.small),
          ],
        );
    }
  }
}

class _Avatar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(userProfileProvider);

    return profile.when(
      data: (user) => Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.primaryFixed, width: 2),
        ),
        clipBehavior: Clip.antiAlias,
        child: Image.network(
          user.avatarUrl,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => const ColoredBox(
            color: AppColors.primaryFixed,
            child: Icon(Icons.person, color: AppColors.primary),
          ),
        ),
      ),
      loading: () => Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.surfaceContainer,
        ),
      ),
      error: (_, __) => Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.surfaceContainer,
        ),
        child: const Icon(Icons.person, color: AppColors.primary),
      ),
    );
  }
}
