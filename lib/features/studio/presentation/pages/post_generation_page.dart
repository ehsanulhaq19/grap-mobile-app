import 'package:flutter/material.dart';

import 'package:grap/core/theme/app_colors.dart';
import 'package:grap/core/theme/app_spacing.dart';
import 'package:grap/core/theme/app_typography.dart';
import 'package:grap/core/widgets/glass_app_bar.dart';
import 'package:grap/core/widgets/glass_card.dart';

class PostGenerationPage extends StatefulWidget {
  const PostGenerationPage({super.key});

  @override
  State<PostGenerationPage> createState() => _PostGenerationPageState();
}

class _PostGenerationPageState extends State<PostGenerationPage> {
  var _selectedDirection = 0;
  var _selectedModel = 0;
  var _previewPlatform = 0;

  static const _directions = [
    'Minimalist',
    'Vibrant',
    'Cinematic',
    'Corporate',
  ];

  static const _models = [
    ('Maya', 'https://lh3.googleusercontent.com/aida-public/AB6AXuAAbOM2tFJLKWV06G0vd0VNpMv5HUMrGOhpJ8IOtGuNEmTnq8xxTOOJrPvqaMlxwcH2gXForPSoAMvm4hGX9Y3qCheUZMOMJFNiAsrtmiZ6Fbdu9jpsOXB6qoOGRsUgWkczqKcGBT4dFwEnTS6ndGfkt9ukyRxXe3BS5bRmX1jVgkKP1M6mUkuN2zdGs686wqoP1fvLOianSRX12-T3k1TbBCDmi6mbFllkotJbhhJ7sXCIFdFBzZ1DBg'),
    ('David', 'https://lh3.googleusercontent.com/aida-public/AB6AXuDhmKz125UJhKmXG21Qx5nDjdAd8k5Cbt4QiS254xAoyZDzsYvYvXECD07-xRTM25SHPQe_043CdCmPOg0K2dVH_dkp0foskajV8oQmMra67Xw3cniXE_-1qKTnBrtETijQ-nq2lrr89vZDxR0cLi9O3Ny5V9njHHBKLgtW6kYQOTe8FLYORdI_XwS_sHQa7G7KgcFdqIfphWYP9ers_DNmTGMAH5UmTiOmr2TLpTLwOWivtzI3v-Ch4w'),
    ('Chloe', 'https://lh3.googleusercontent.com/aida-public/AB6AXuCq9GmTgv5cXx4FXSEOWJfK3rtJ-txeShjZsZlEII2sR_eCp3vdStXgCky2F1zIUbyVginLk0B7ETY3CRmGRGRBOI4WKoiFEo5eRQ_GRZWK3m8RUDDY_g0OeM6lfD7l9kzd5sViv5cZySr1AW7rQptbkAsPru60p1bxjxfvsiK932tLURf5Ib88hp5tZXYH1FmxkxQoQE64vjeZGKjLNCVXobwOuWJs3G3YzHb6aojRHD5rGJT_aLp-IQ'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlassAppBar(
        variant: AppBarVariant.back,
        onBack: () => Navigator.of(context).maybePop(),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.containerMargin),
        children: [
          Text('Craft Your Post', style: AppTypography.headlineXl),
          const SizedBox(height: AppSpacing.xs),
          Text(
            'Design high-converting social media content with our AI assistant.',
            style: AppTypography.bodyLg.copyWith(
              color: AppColors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          _SectionCard(
            title: 'Source Material',
            icon: Icons.upload_file,
            child: _UploadArea(),
          ),
          const SizedBox(height: AppSpacing.lg),
          _SectionCard(
            title: 'Visual Styling',
            icon: Icons.tune,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Art Direction', style: AppTypography.labelMd),
                const SizedBox(height: AppSpacing.sm),
                Wrap(
                  spacing: AppSpacing.sm,
                  runSpacing: AppSpacing.sm,
                  children: [
                    for (var i = 0; i < _directions.length; i++)
                      FilterChip(
                        label: Text(_directions[i]),
                        selected: _selectedDirection == i,
                        onSelected: (_) =>
                            setState(() => _selectedDirection = i),
                        selectedColor:
                            AppColors.primaryContainer.withValues(alpha: 0.1),
                        checkmarkColor: AppColors.primary,
                        labelStyle: AppTypography.labelSm.copyWith(
                          color: _selectedDirection == i
                              ? AppColors.primary
                              : AppColors.onSurfaceVariant,
                        ),
                      ),
                    ActionChip(
                      avatar: const Icon(Icons.add, size: 14),
                      label: const Text('Custom'),
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.lg),
                Row(
                  children: [
                    Text('AI Human Models', style: AppTypography.labelMd),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryContainer.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        'Beta',
                        style: AppTypography.labelSm.copyWith(
                          color: AppColors.primary,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.sm),
                SizedBox(
                  height: 140,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: _models.length + 1,
                    separatorBuilder: (_, __) =>
                        const SizedBox(width: AppSpacing.md),
                    itemBuilder: (context, index) {
                      if (index == _models.length) {
                        return _NoModelCard();
                      }
                      final selected = _selectedModel == index;
                      return _ModelCard(
                        name: _models[index].$1,
                        imageUrl: _models[index].$2,
                        selected: selected,
                        onTap: () => setState(() => _selectedModel = index),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          _SectionCard(
            title: 'Content Prompt',
            icon: Icons.edit_note,
            child: Column(
              children: [
                TextField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText:
                        "Describe the post you want to create... e.g., 'A promotional post for our new summer collection.'",
                    hintStyle: AppTypography.bodyMd.copyWith(
                      color:
                          AppColors.onSurfaceVariant.withValues(alpha: 0.5),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: FilledButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.auto_fix_high, size: 18),
                    label: const Text('Generate Post'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          GlassCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.preview,
                            size: 18,
                            color: AppColors.primary,
                          ),
                          const SizedBox(width: AppSpacing.xs),
                          Text(
                            'Live Preview',
                            style: AppTypography.labelMd,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          _PlatformTab(
                            label: 'IG',
                            selected: _previewPlatform == 0,
                            onTap: () => setState(() => _previewPlatform = 0),
                          ),
                          const SizedBox(width: 4),
                          _PlatformTab(
                            label: 'FB',
                            selected: _previewPlatform == 1,
                            onTap: () => setState(() => _previewPlatform = 1),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1),
                _InstagramPreview(),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          GlassCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Direct Publish', style: AppTypography.labelMd),
                const SizedBox(height: AppSpacing.sm),
                _PublishButton(
                  label: 'Post to Facebook',
                  color: AppColors.facebook,
                  icon: Icons.share,
                ),
                const SizedBox(height: AppSpacing.sm),
                _PublishButton(
                  label: 'Share to Instagram',
                  color: AppColors.instagram,
                  icon: Icons.photo_camera_outlined,
                ),
                const SizedBox(height: AppSpacing.sm),
                _PublishButton(
                  label: 'Send via WhatsApp',
                  color: AppColors.whatsapp,
                  icon: Icons.chat_outlined,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({
    required this.title,
    required this.icon,
    required this.child,
  });

  final String title;
  final IconData icon;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(AppSpacing.radiusXl),
        border: Border.all(
          color: AppColors.outlineVariant.withValues(alpha: 0.2),
        ),
        boxShadow: const [
          BoxShadow(
            color: AppColors.ambientShadow,
            blurRadius: 20,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: AppColors.primary),
              const SizedBox(width: AppSpacing.xs),
              Text(
                title,
                style: AppTypography.bodyLg.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          child,
        ],
      ),
    );
  }
}

class _UploadArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        border: Border.all(
          color: AppColors.outlineVariant.withValues(alpha: 0.5),
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: AppColors.primaryContainer.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.cloud_upload, color: AppColors.primary),
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            'Drag & drop your product image or video',
            style: AppTypography.bodyMd.copyWith(fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          Text(
            'Supported formats: JPG, PNG, MP4 (Max 50MB)',
            style: AppTypography.bodySm.copyWith(
              color: AppColors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          OutlinedButton(
            onPressed: () {},
            child: const Text('Browse Files'),
          ),
        ],
      ),
    );
  }
}

class _ModelCard extends StatelessWidget {
  const _ModelCard({
    required this.name,
    required this.imageUrl,
    required this.selected,
    required this.onTap,
  });

  final String name;
  final String imageUrl;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          border: Border.all(
            color: selected ? AppColors.primary : AppColors.outlineVariant,
            width: selected ? 2 : 1,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(imageUrl, fit: BoxFit.cover),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.6),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            Positioned(
              left: 8,
              bottom: 8,
              child: Text(
                name,
                style: AppTypography.labelSm.copyWith(color: Colors.white),
              ),
            ),
            if (selected)
              const Positioned(
                top: 8,
                right: 8,
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: AppColors.primary,
                  child: Icon(Icons.check, size: 16, color: Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _NoModelCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        border: Border.all(color: AppColors.outlineVariant),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.block, color: AppColors.outline),
          Text(
            'No Model',
            style: AppTypography.labelSm.copyWith(
              color: AppColors.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _PlatformTab extends StatelessWidget {
  const _PlatformTab({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: selected
              ? AppColors.primaryContainer.withValues(alpha: 0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: AppTypography.labelSm.copyWith(
            color: selected ? AppColors.primary : AppColors.onSurfaceVariant,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _InstagramPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Row(
              children: [
                const CircleAvatar(radius: 16, backgroundColor: AppColors.surfaceContainer),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'lumina_lifestyle',
                        style: AppTypography.labelSm.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.onSurface,
                        ),
                      ),
                      Text(
                        'Sponsored',
                        style: AppTypography.labelSm.copyWith(
                          fontSize: 10,
                          color: AppColors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.more_horiz, color: AppColors.onSurfaceVariant),
              ],
            ),
          ),
          AspectRatio(
            aspectRatio: 1,
            child: Image.network(
              'https://lh3.googleusercontent.com/aida-public/AB6AXuBwhNQ4umIdssLKD7esLrKNSYnv7ieHZL7QQsguOqImO0Nj4fItsah4WtSqBR0lOtDRJS_JZyQ1ZTCmOjP8PPP_609JknX1xQpuvTCYnhg7axL9n6bxERVEZQZ5QyTkGG7s5D8aeDpSRHV5pfpRTuE2FTVmA_JbZpcdnysDk_GKqz_1_Qtm7lRk6OBmBzQIqaImO2bWwXOQsx77gn0qxyOueWwqcsez8jCgmvKtCWtKH28gC_Br8yZhNw',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Row(
                  children: [
                    Icon(Icons.favorite_border),
                    SizedBox(width: 12),
                    Icon(Icons.chat_bubble_outline),
                    SizedBox(width: 12),
                    Icon(Icons.send_outlined),
                  ],
                ),
                Icon(Icons.bookmark_border),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.md,
              0,
              AppSpacing.md,
              AppSpacing.md,
            ),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'lumina_lifestyle ',
                    style: AppTypography.bodySm.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.onSurface,
                    ),
                  ),
                  TextSpan(
                    text:
                        'Hydration meets sustainability. 🌿 Our new glass collection is here to elevate your daily routine.\n\n',
                    style: AppTypography.bodySm.copyWith(
                      color: AppColors.onSurface,
                    ),
                  ),
                  TextSpan(
                    text: '#EcoFriendly #SustainableLiving #NewArrivals',
                    style: AppTypography.bodySm.copyWith(color: AppColors.primary),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PublishButton extends StatelessWidget {
  const _PublishButton({
    required this.label,
    required this.color,
    required this.icon,
  });

  final String label;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: color),
      label: Text(label, style: TextStyle(color: color)),
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, 44),
        side: BorderSide(color: color.withValues(alpha: 0.3)),
        backgroundColor: color.withValues(alpha: 0.1),
      ),
    );
  }
}
