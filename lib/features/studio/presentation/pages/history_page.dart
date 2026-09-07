import 'package:flutter/material.dart';

import 'package:grap/core/theme/app_colors.dart';
import 'package:grap/core/theme/app_spacing.dart';
import 'package:grap/core/theme/app_typography.dart';
import 'package:grap/core/widgets/app_text_field.dart';
import 'package:grap/core/widgets/glass_app_bar.dart';
import 'package:grap/core/widgets/glass_card.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  var _filterIndex = 0;

  @override
  Widget build(BuildContext context) {
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
          Text('Your History', style: AppTypography.headlineLgMobile),
          const SizedBox(height: AppSpacing.xs),
          Text(
            'Review and manage your previously generated content.',
            style: AppTypography.bodySm.copyWith(
              color: AppColors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          FilterChipRow(
            labels: const ['All Types', 'Images', 'Copywriting', 'Campaigns'],
            selectedIndex: _filterIndex,
            onSelected: (i) => setState(() => _filterIndex = i),
          ),
          const SizedBox(height: AppSpacing.lg),
          _FeaturedHistoryCard(),
          const SizedBox(height: AppSpacing.md),
          _CopyHistoryCard(),
          const SizedBox(height: AppSpacing.md),
          _StrategyHistoryCard(),
          const SizedBox(height: AppSpacing.md),
          _SmallImageCard(),
          const SizedBox(height: AppSpacing.lg),
          Center(
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.expand_more),
              label: const Text('Load Older History'),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.primary,
                side: BorderSide(
                  color: AppColors.outlineVariant.withValues(alpha: 0.5),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FeaturedHistoryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(AppSpacing.radiusLg),
                ),
                child: Image.network(
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuAUHpD61fxO2AdSrGPg8OxgwTSbPR0aH_L_Nr1G86rMJTVaBzBPPX3gJu1iVUcvjqoTbN9lpYy0lUgO9uuU9CcgDTA29irvnaKRARxWrFE-ony79AoWsxT871hiOhzyHUbj8eVLSpl12tFDzlfN78WK00qlg3IMwB56c3cK025DB5iTIqOaEnLWbPDgoWHmELGbHRDptrKN4L7SqVUh8nZYgAPlgtvHQMoSdrOa-RrnvH11xUsbtSDn6w',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: AppSpacing.sm,
                right: AppSpacing.sm,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.surface.withValues(alpha: 0.9),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.image, size: 14, color: AppColors.primary),
                      const SizedBox(width: 4),
                      Text('Image', style: AppTypography.labelSm),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.schedule, size: 16, color: AppColors.onSurfaceVariant),
                    const SizedBox(width: 4),
                    Text(
                      'Today, 2:45 PM',
                      style: AppTypography.labelSm.copyWith(
                        color: AppColors.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  '"Futuristic Smart Home Interior at Sunset"',
                  style: AppTypography.bodyLg.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Photorealistic render, golden hour lighting, minimalist furniture...',
                  style: AppTypography.bodySm.copyWith(
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
                const Divider(height: AppSpacing.lg),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        _Tag('4K Resolution'),
                        const SizedBox(width: 8),
                        _Tag('V5 Engine'),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.download, color: AppColors.primary),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CopyHistoryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.secondary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.edit_document, size: 14, color: AppColors.secondary),
                    const SizedBox(width: 4),
                    Text(
                      'Copy',
                      style: AppTypography.labelSm.copyWith(
                        color: AppColors.secondary,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert, color: AppColors.outlineVariant),
              ),
            ],
          ),
          Text(
            'Yesterday, 10:15 AM',
            style: AppTypography.labelSm.copyWith(
              color: AppColors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            'Spring Collection Email Sequence',
            style: AppTypography.bodyMd.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: AppSpacing.sm),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppSpacing.sm),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
              border: Border.all(
                color: AppColors.outlineVariant.withValues(alpha: 0.2),
              ),
            ),
            child: Text(
              '"Subject: Bloom into the new season 🌸... Hey there, ready to refresh your wardrobe?..."',
              style: AppTypography.bodySm.copyWith(
                color: AppColors.onSurfaceVariant,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '3 Variants',
                style: AppTypography.labelSm.copyWith(
                  color: AppColors.onSurfaceVariant,
                ),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward, size: 16),
                label: const Text('View'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StrategyHistoryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.tertiary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(999),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.lightbulb_outline, size: 14, color: AppColors.tertiary),
                const SizedBox(width: 4),
                Text(
                  'Strategy',
                  style: AppTypography.labelSm.copyWith(color: AppColors.tertiary),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Oct 24, 4:30 PM',
            style: AppTypography.labelSm.copyWith(
              color: AppColors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            'Q4 Holiday Marketing Plan',
            style: AppTypography.bodyMd.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: AppSpacing.sm),
          _CheckItem('Target Audience Defined', done: true),
          _CheckItem('Budget Allocation Proposed', done: true),
          _CheckItem('Content Calendar Draft', done: false),
          const Divider(height: AppSpacing.lg),
          Align(
            alignment: Alignment.centerRight,
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.open_in_new, size: 16),
              label: const Text('Open Draft'),
            ),
          ),
        ],
      ),
    );
  }
}

class _SmallImageCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(AppSpacing.radiusLg),
            ),
            child: Image.network(
              'https://lh3.googleusercontent.com/aida-public/AB6AXuBz1f4b0d9RhKCOC1ENW99OoAhn3MbmL21Jt7MJ76lAlTl-aixS3hAKae6nOGmZTABb4v-5aPRR4ZJL7EeQfehEpLe0z-s2VcZHlGNVck8w0xcg90pfP_5fvhCZvL_rSYGp6pdLCDjcxEU5I7qB7qYVqmz6pYnieSit3q4zwEJtxsTeuxu5nn4FP4WIgrNnE3IDHAowQQv6Q6iNloPRbmrufmaq1LjWIdWvHIdb0B6XkZIDwBrKi_ipAA',
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Oct 22, 11:00 AM',
                  style: AppTypography.labelSm.copyWith(
                    color: AppColors.onSurfaceVariant,
                    fontSize: 10,
                  ),
                ),
                Text(
                  'Skincare Product Flat-lay',
                  style: AppTypography.bodySm.copyWith(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  const _Tag(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainer,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: AppTypography.labelSm.copyWith(
          color: AppColors.onSurfaceVariant,
          fontSize: 10,
        ),
      ),
    );
  }
}

class _CheckItem extends StatelessWidget {
  const _CheckItem(this.label, {required this.done});

  final String label;
  final bool done;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(
            done ? Icons.check_circle : Icons.pending,
            size: 16,
            color: done ? AppColors.primary : AppColors.outlineVariant,
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: AppTypography.bodySm.copyWith(
              color: AppColors.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
