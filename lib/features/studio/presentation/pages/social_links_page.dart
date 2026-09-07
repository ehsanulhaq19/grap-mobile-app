import 'package:flutter/material.dart';

import 'package:grap/core/theme/app_colors.dart';
import 'package:grap/core/theme/app_spacing.dart';
import 'package:grap/core/theme/app_typography.dart';
import 'package:grap/core/widgets/glass_app_bar.dart';
import 'package:grap/core/widgets/glass_card.dart';

class SocialLinksPage extends StatefulWidget {
  const SocialLinksPage({super.key});

  @override
  State<SocialLinksPage> createState() => _SocialLinksPageState();
}

class _SocialLinksPageState extends State<SocialLinksPage> {
  final _connections = <String, bool>{
    'Instagram': true,
    'Facebook': true,
    'LinkedIn': false,
    'X (Twitter)': false,
    'WhatsApp Business': false,
  };

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
          Text('Social Channels', style: AppTypography.headlineLgMobile),
          const SizedBox(height: AppSpacing.xs),
          Text(
            'Connect your accounts to publish AI-generated content directly from GRAP.',
            style: AppTypography.bodyMd.copyWith(
              color: AppColors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          GlassCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Connected Accounts',
                  style: AppTypography.bodyLg.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                for (final entry in _connections.entries) ...[
                  _SocialTile(
                    platform: entry.key,
                    connected: entry.value,
                    onChanged: (v) =>
                        setState(() => _connections[entry.key] = v),
                  ),
                  if (entry.key != _connections.keys.last)
                    Divider(
                      color: AppColors.outlineVariant.withValues(alpha: 0.3),
                      height: AppSpacing.lg,
                    ),
                ],
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          GlassCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Publishing Preferences',
                  style: AppTypography.bodyLg.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                _PreferenceRow(
                  title: 'Auto-schedule posts',
                  subtitle: 'Queue generated posts for optimal times',
                  value: true,
                  onChanged: (_) {},
                ),
                const SizedBox(height: AppSpacing.md),
                _PreferenceRow(
                  title: 'Include brand watermark',
                  subtitle: 'Add your logo to exported visuals',
                  value: false,
                  onChanged: (_) {},
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.link),
            label: const Text('Connect New Account'),
          ),
        ],
      ),
    );
  }
}

class _SocialTile extends StatelessWidget {
  const _SocialTile({
    required this.platform,
    required this.connected,
    required this.onChanged,
  });

  final String platform;
  final bool connected;
  final ValueChanged<bool> onChanged;

  IconData get _icon => switch (platform) {
        'Instagram' => Icons.photo_camera_outlined,
        'Facebook' => Icons.facebook,
        'LinkedIn' => Icons.work_outline,
        'X (Twitter)' => Icons.tag,
        _ => Icons.chat_outlined,
      };

  Color get _color => switch (platform) {
        'Instagram' => AppColors.instagram,
        'Facebook' => AppColors.facebook,
        'WhatsApp Business' => AppColors.whatsapp,
        _ => AppColors.primary,
      };

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: _color.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(_icon, color: _color, size: 22),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(platform, style: AppTypography.bodyMd.copyWith(
                fontWeight: FontWeight.w500,
              )),
              Text(
                connected ? 'Connected' : 'Not connected',
                style: AppTypography.labelSm.copyWith(
                  color: connected
                      ? AppColors.secondary
                      : AppColors.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        Switch(
          value: connected,
          onChanged: onChanged,
          activeTrackColor: AppColors.primary,
        ),
      ],
    );
  }
}

class _PreferenceRow extends StatelessWidget {
  const _PreferenceRow({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTypography.bodyMd),
              Text(
                subtitle,
                style: AppTypography.bodySm.copyWith(
                  color: AppColors.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeTrackColor: AppColors.primary,
        ),
      ],
    );
  }
}
