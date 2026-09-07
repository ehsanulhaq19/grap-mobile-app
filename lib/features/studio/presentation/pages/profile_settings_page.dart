import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:grap/core/constants/app_constants.dart';
import 'package:grap/core/theme/app_colors.dart';
import 'package:grap/core/theme/app_spacing.dart';
import 'package:grap/core/theme/app_typography.dart';
import 'package:grap/core/widgets/app_text_field.dart';
import 'package:grap/core/widgets/glass_app_bar.dart';
import 'package:grap/core/widgets/glass_card.dart';
import 'package:grap/features/auth/presentation/providers/auth_providers.dart';
import 'package:grap/features/studio/presentation/providers/studio_providers.dart';
import 'package:grap/features/studio/presentation/widgets/settings_link.dart';
import 'package:grap/features/studio/presentation/widgets/settings_toggle_row.dart';

class ProfileSettingsPage extends ConsumerStatefulWidget {
  const ProfileSettingsPage({super.key});

  @override
  ConsumerState<ProfileSettingsPage> createState() =>
      _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends ConsumerState<ProfileSettingsPage> {
  var _marketingInsights = true;
  var _darkMode = false;

  Future<void> _logOut() async {
    final signOut = ref.read(signOutUseCaseProvider);
    await signOut();
    if (!mounted) return;
    context.go(AppConstants.loginRoute);
  }

  @override
  Widget build(BuildContext context) {
    final profile = ref.watch(userProfileProvider);
    return Scaffold(
      appBar: const GlassAppBar(
        variant: AppBarVariant.profile,
        showCredits: false,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.containerMargin,
          AppSpacing.xl,
          AppSpacing.containerMargin,
          AppSpacing.xxl,
        ),
        children: [
          Text(
            'Account Settings',
            style: AppTypography.headlineLg,
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            'Manage your personal information and app preferences.',
            style: AppTypography.bodyMd.copyWith(
              color: AppColors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          Center(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: 128,
                      height: 128,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.surface, width: 4),
                        boxShadow: const [
                          BoxShadow(
                            color: AppColors.ambientShadow,
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: profile.when(
                        data: (user) => Image.network(
                          user.avatarUrl,
                          fit: BoxFit.cover,
                        ),
                        loading: () => const ColoredBox(
                          color: AppColors.primaryFixed,
                        ),
                        error: (_, __) => const ColoredBox(
                          color: AppColors.primaryFixed,
                          child: Icon(Icons.person, color: AppColors.primary),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Material(
                        color: Colors.black26,
                        shape: const CircleBorder(),
                        child: Icon(Icons.photo_camera, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Change Avatar',
                    style: AppTypography.labelMd.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          GlassCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Personal Information', style: AppTypography.headlineMd),
                const SizedBox(height: AppSpacing.md),
                const AppTextField(
                  label: 'Full Name',
                  hint: 'Jane Doe',
                  icon: Icons.person_outline,
                ),
                const SizedBox(height: AppSpacing.md),
                const AppTextField(
                  label: 'Email Address',
                  hint: 'jane@example.com',
                  icon: Icons.mail_outline,
                  keyboardType: TextInputType.emailAddress,
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          GlassCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Security', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
                SizedBox(height: AppSpacing.md),
                AppTextField(
                  label: 'New Password',
                  hint: '••••••••',
                  icon: Icons.lock_outline,
                  obscureText: true,
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          GlassCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('App Preferences', style: AppTypography.headlineMd),
                const SizedBox(height: AppSpacing.md),
                SettingsToggleRow(
                  title: 'Marketing Insights',
                  subtitle: 'Receive AI-generated tips weekly',
                  value: _marketingInsights,
                  onChanged: (v) => setState(() => _marketingInsights = v),
                ),
                const Divider(height: AppSpacing.lg),
                SettingsToggleRow(
                  title: 'Dark Mode',
                  subtitle: 'Toggle dark theme appearance',
                  value: _darkMode,
                  onChanged: (v) => setState(() => _darkMode = v),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          SettingsLink(
            icon: Icons.bar_chart_outlined,
            title: 'Usage & Billing',
            onTap: () => context.push(AppConstants.usageBillingRoute),
          ),
          const SizedBox(height: AppSpacing.sm),
          SettingsLink(
            icon: Icons.workspace_premium_outlined,
            title: 'Subscriptions',
            onTap: () => context.push(AppConstants.subscriptionsRoute),
          ),
          const SizedBox(height: AppSpacing.sm),
          SettingsLink(
            icon: Icons.battery_4_bar,
            title: 'Free Mode Status',
            onTap: () => context.push(AppConstants.freeModeRoute),
          ),
          const SizedBox(height: AppSpacing.lg),
          Row(
            children: [
              Expanded(
                child: FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.save, size: 18),
                  label: const Text('Save Changes'),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          OutlinedButton.icon(
            onPressed: _logOut,
            icon: const Icon(Icons.logout, size: 18),
            label: const Text('Log Out'),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.error,
              side: const BorderSide(color: AppColors.error),
              minimumSize: const Size(double.infinity, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
              ),
              textStyle: AppTypography.labelMd,
            ),
          ),
        ],
      ),
    );
  }
}
