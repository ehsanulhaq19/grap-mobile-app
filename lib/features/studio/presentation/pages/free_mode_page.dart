import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:grap/core/constants/app_constants.dart';
import 'package:grap/core/theme/app_colors.dart';
import 'package:grap/core/theme/app_spacing.dart';
import 'package:grap/core/theme/app_typography.dart';
import 'package:grap/core/widgets/glass_app_bar.dart';
import 'package:grap/core/widgets/glass_card.dart';
import 'package:grap/features/studio/presentation/providers/studio_providers.dart';

class FreeModePage extends StatelessWidget {
  const FreeModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlassAppBar(),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.containerMargin,
          AppSpacing.xl,
          AppSpacing.containerMargin,
          AppSpacing.xxl,
        ),
        children: [
          Text(
            'Your Creative Journey',
            style: AppTypography.headlineLgMobile,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            'You are currently exploring GRAP on the Free Tier. Here is a summary of your available tools and how you can unlock more power.',
            style: AppTypography.bodyLg.copyWith(
              color: AppColors.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.xl),
          _CreditsCard(),
          const SizedBox(height: AppSpacing.gutter),
          _FeaturesCard(),
          const SizedBox(height: AppSpacing.xl),
          _UpgradeBanner(onTap: () => context.push(AppConstants.subscriptionsRoute)),
          const SizedBox(height: AppSpacing.xl),
          Text('Need a quick boost?', style: AppTypography.headlineMd),
          const SizedBox(height: AppSpacing.md),
          _BoostTile(
            icon: Icons.person_add,
            color: AppColors.secondary,
            title: 'Refer a Colleague',
            subtitle: 'Earn 100 credits for each friend who signs up.',
          ),
          const SizedBox(height: AppSpacing.gutter),
          _BoostTile(
            icon: Icons.rate_review_outlined,
            color: AppColors.tertiary,
            title: 'Leave a Review',
            subtitle: 'Get 50 credits for sharing your experience.',
          ),
        ],
      ),
    );
  }
}

class _CreditsCard extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final credits = ref.watch(creditBalanceProvider);

    return credits.when(
      data: (balance) => Container(
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(AppSpacing.radiusXl),
          border: Border.all(
            color: AppColors.outlineVariant.withValues(alpha: 0.3),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.1),
              blurRadius: 20,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Available Credits', style: AppTypography.headlineMd),
                const Icon(Icons.battery_4_bar, color: AppColors.primary, size: 32),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              '${balance.available}',
              style: AppTypography.headlineXl.copyWith(color: AppColors.primary),
            ),
            Text(
              'Credits reset every 30 days. Generating a standard campaign uses ~10 credits.',
              style: AppTypography.bodySm.copyWith(
                color: AppColors.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            ClipRRect(
              borderRadius: BorderRadius.circular(999),
              child: LinearProgressIndicator(
                value: balance.usageRatio,
                minHeight: 8,
                backgroundColor: AppColors.surfaceVariant,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '${(balance.usageRatio * 100).round()}% Used',
                style: AppTypography.labelSm.copyWith(color: AppColors.outline),
              ),
            ),
          ],
        ),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, __) => const SizedBox.shrink(),
    );
  }
}

class _FeaturesCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.star, color: AppColors.tertiary),
              const SizedBox(width: AppSpacing.xs),
              Text('Current Features', style: AppTypography.headlineMd),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          _FeatureLine('Standard Text Generation', unlocked: true),
          _FeatureLine('Basic Campaign Templates', unlocked: true),
          _FeatureLine('Advanced Analytics (Pro)', unlocked: false),
          _FeatureLine('Custom Brand Voices (Pro)', unlocked: false),
        ],
      ),
    );
  }
}

class _FeatureLine extends StatelessWidget {
  const _FeatureLine(this.text, {required this.unlocked});

  final String text;
  final bool unlocked;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Row(
        children: [
          Icon(
            unlocked ? Icons.check_circle : Icons.lock,
            size: 16,
            color: unlocked ? AppColors.secondary : AppColors.outline,
          ),
          const SizedBox(width: AppSpacing.xs),
          Text(
            text,
            style: AppTypography.bodyMd.copyWith(
              color: unlocked
                  ? AppColors.onSurfaceVariant
                  : AppColors.outline,
            ),
          ),
        ],
      ),
    );
  }
}

class _UpgradeBanner extends StatelessWidget {
  const _UpgradeBanner({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primaryContainer.withValues(alpha: 0.2),
            AppColors.tertiaryContainer.withValues(alpha: 0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(AppSpacing.radiusXl),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.1)),
      ),
      child: Column(
        children: [
          Text(
            'Ready for Unrestricted Creativity?',
            style: AppTypography.headlineMd,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Upgrade to Pro to unlock unlimited credits, custom brand voice modeling, and our advanced analytics suite.',
            style: AppTypography.bodyMd.copyWith(
              color: AppColors.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.lg),
          FilledButton.icon(
            onPressed: onTap,
            icon: const Icon(Icons.rocket_launch, size: 18),
            label: const Text('Explore Pro Plans'),
          ),
        ],
      ),
    );
  }
}

class _BoostTile extends StatelessWidget {
  const _BoostTile({
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        border: Border.all(
          color: AppColors.outlineVariant.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.sm),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTypography.bodyMd.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  subtitle,
                  style: AppTypography.bodySm.copyWith(
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
