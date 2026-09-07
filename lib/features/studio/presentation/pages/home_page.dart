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

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(userProfileProvider);

    return Scaffold(
      appBar: const GlassAppBar(),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.containerMargin,
          AppSpacing.lg,
          AppSpacing.containerMargin,
          AppSpacing.xxl,
        ),
        children: [
          profile.when(
            data: (user) => Text(
              'Good morning, ${user.fullName.split(' ').first}.',
              style: AppTypography.headlineLgMobile,
            ),
            loading: () => Text(
              'Good morning.',
              style: AppTypography.headlineLgMobile,
            ),
            error: (_, __) => Text(
              'Good morning.',
              style: AppTypography.headlineLgMobile,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            'What shall we create today?',
            style: AppTypography.bodyLg.copyWith(
              color: AppColors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          _QuickMagicCard(
            onTap: () => context.push(AppConstants.postGenerationRoute),
          ),
          const SizedBox(height: AppSpacing.xl),
          Text(
            'Creative Toolkit',
            style: AppTypography.bodyLg.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: AppSpacing.md),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: AppSpacing.md,
            crossAxisSpacing: AppSpacing.md,
            childAspectRatio: 0.95,
            children: [
              _ToolCard(
                icon: Icons.edit_document,
                title: 'Write Copy',
                subtitle: 'Blogs, ads, emails',
                color: AppColors.primary,
                onTap: () => context.push(AppConstants.contentGenerationRoute),
              ),
              _ToolCard(
                icon: Icons.image_outlined,
                title: 'Design Image',
                subtitle: 'Visuals & banners',
                color: AppColors.tertiary,
                onTap: () => context.push(AppConstants.imageGenerationRoute),
              ),
              _ToolCard(
                icon: Icons.hub_outlined,
                title: 'Link Socials',
                subtitle: 'Manage channels',
                color: AppColors.secondary,
                spanFull: true,
                onTap: () => context.go(AppConstants.socialRoute),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xl),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent History',
                style: AppTypography.bodyLg.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextButton(
                onPressed: () => context.go(AppConstants.historyRoute),
                child: Text(
                  'View All',
                  style: AppTypography.labelSm.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          _HistoryItem(
            icon: Icons.edit_document,
            title: 'Spring Campaign Launch Email',
            subtitle: 'Generated 2 hours ago',
          ),
          const SizedBox(height: AppSpacing.sm),
          _HistoryItem(
            icon: Icons.image_outlined,
            title: 'Abstract Tech Background',
            subtitle: 'Generated yesterday',
            imageUrl:
                'https://lh3.googleusercontent.com/aida-public/AB6AXuCA0yZZuDbJUGZApqsjcyMuGP2fb3i2dysun8ap6LWwu-cWyj4k-aeXREFkWAn6CJzHbDBuBNtLIV8chZ4E6yTC_32Zdb6UeWnCTMuu_GcBBgG4oTYpZnNeZcPrRn5XmxSAh139_t3YlzhfdHf8qULdDKriJRSer5Ztdvru6DBIfwPvJru2DF-F36jwCvzsbtRLl22uzWSYTKpyl7BnGUaTFlXQnR1y-P3uSlMUyBaGtHLkyceX_yP5BQ',
          ),
        ],
      ),
    );
  }
}

class _QuickMagicCard extends StatelessWidget {
  const _QuickMagicCard({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSpacing.radiusXl),
        child: Ink(
          padding: const EdgeInsets.all(AppSpacing.lg),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.primary, AppColors.primaryContainer],
            ),
            borderRadius: BorderRadius.circular(AppSpacing.radiusXl),
            boxShadow: const [
              BoxShadow(
                color: AppColors.ambientShadow,
                blurRadius: 16,
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Quick Magic Post',
                style: AppTypography.headlineMd.copyWith(
                  color: AppColors.onPrimary,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                'Let AI analyze trending topics and draft a complete social post in seconds.',
                style: AppTypography.bodyMd.copyWith(
                  color: AppColors.onPrimary.withValues(alpha: 0.9),
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: AppSpacing.sm,
                ),
                decoration: BoxDecoration(
                  color: AppColors.onPrimary,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.auto_fix_high,
                      size: 18,
                      color: AppColors.primary,
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    Text(
                      'Generate Now',
                      style: AppTypography.labelMd.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ToolCard extends StatelessWidget {
  const _ToolCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
    this.spanFull = false,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;
  final bool spanFull;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(title, style: AppTypography.labelMd),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: AppTypography.labelSm.copyWith(
              color: AppColors.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _HistoryItem extends StatelessWidget {
  const _HistoryItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.imageUrl,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(AppSpacing.sm),
      borderRadius: AppSpacing.radiusMd,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(8),
            ),
            clipBehavior: Clip.antiAlias,
            child: imageUrl != null
                ? Image.network(imageUrl!, fit: BoxFit.cover)
                : Icon(icon, size: 20, color: AppColors.onSurfaceVariant),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTypography.bodySm.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  subtitle,
                  style: AppTypography.labelSm.copyWith(
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert, color: AppColors.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}
