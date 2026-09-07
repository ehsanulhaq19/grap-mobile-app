import 'package:flutter/material.dart';

import 'package:grap/core/theme/app_colors.dart';
import 'package:grap/core/theme/app_spacing.dart';
import 'package:grap/core/theme/app_typography.dart';
import 'package:grap/core/widgets/ambient_background.dart';
import 'package:grap/core/widgets/glass_card.dart';
import 'package:grap/core/widgets/glass_app_bar.dart';
import 'package:grap/features/studio/presentation/shell/main_shell.dart';

class SubscriptionsPage extends StatefulWidget {
  const SubscriptionsPage({super.key});

  @override
  State<SubscriptionsPage> createState() => _SubscriptionsPageState();
}

class _SubscriptionsPageState extends State<SubscriptionsPage> {
  var _annualBilling = true;

  @override
  Widget build(BuildContext context) {
    return AmbientBackground(
      child: StudioScaffold(
        appBarVariant: AppBarVariant.back,
        showCredits: false,
        onBack: () => Navigator.of(context).maybePop(),
        body: ListView(
          padding: const EdgeInsets.all(AppSpacing.containerMargin),
          children: [
            Text(
              'Unlock Limitless Creativity',
              style: AppTypography.headlineLgMobile,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'Choose the perfect plan to elevate your marketing campaigns with intelligent, AI-driven concierge assistance.',
              style: AppTypography.bodyLg.copyWith(
                color: AppColors.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.lg),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Monthly',
                  style: AppTypography.labelMd.copyWith(
                    color: _annualBilling
                        ? AppColors.onSurfaceVariant
                        : AppColors.onSurface,
                  ),
                ),
                Switch(
                  value: _annualBilling,
                  onChanged: (v) => setState(() => _annualBilling = v),
                  activeTrackColor: AppColors.primary,
                ),
                Row(
                  children: [
                    Text('Annually', style: AppTypography.labelMd),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.tertiaryContainer.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        'Save 20%',
                        style: AppTypography.labelSm.copyWith(
                          color: AppColors.tertiary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xl),
            _PlanCard(
              name: 'Basic',
              price: r'$19',
              description:
                  'Essential tools for individual creators starting their AI journey.',
              features: const [
                '500 AI Credits per month',
                'Standard resolution generation',
                'Basic copywriting templates',
              ],
              buttonLabel: 'Get Started',
              outlined: true,
            ),
            const SizedBox(height: AppSpacing.lg),
            _PlanCard(
              name: 'Pro',
              price: r'$49',
              description:
                  'Advanced capabilities for professional marketers and small teams.',
              features: const [
                '2,500 AI Credits per month',
                'High-resolution & 4K exports',
                'Priority generation queue',
                'Advanced brand voice customization',
              ],
              buttonLabel: 'Upgrade to Pro',
              recommended: true,
            ),
            const SizedBox(height: AppSpacing.lg),
            _PlanCard(
              name: 'Enterprise',
              price: r'$199',
              description:
                  'Custom solutions and unlimited power for large-scale operations.',
              features: const [
                'Unlimited AI Credits',
                'Dedicated Concierge Manager',
                'Custom API integrations',
              ],
              buttonLabel: 'Contact Sales',
              outlined: true,
            ),
          ],
        ),
      ),
    );
  }
}

class _PlanCard extends StatelessWidget {
  const _PlanCard({
    required this.name,
    required this.price,
    required this.description,
    required this.features,
    required this.buttonLabel,
    this.recommended = false,
    this.outlined = false,
  });

  final String name;
  final String price;
  final String description;
  final List<String> features;
  final String buttonLabel;
  final bool recommended;
  final bool outlined;

  @override
  Widget build(BuildContext context) {
    final card = Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: recommended ? AppColors.glassFill : AppColors.surface,
        borderRadius: BorderRadius.circular(AppSpacing.radiusXl),
        border: Border.all(
          color: recommended
              ? AppColors.primary.withValues(alpha: 0.5)
              : AppColors.outlineVariant.withValues(alpha: 0.3),
          width: recommended ? 2 : 1,
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
          if (recommended)
            Center(
              child: Container(
                margin: const EdgeInsets.only(bottom: AppSpacing.md),
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.primary, AppColors.tertiary],
                  ),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.stars, size: 14, color: Colors.white),
                    const SizedBox(width: 4),
                    Text(
                      'Recommended',
                      style: AppTypography.labelSm.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          Text(
            name,
            style: AppTypography.headlineMd.copyWith(
              color: recommended ? AppColors.primary : AppColors.onSurface,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            description,
            style: AppTypography.bodySm.copyWith(
              color: AppColors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(text: price, style: AppTypography.headlineXl),
                TextSpan(
                  text: '/mo',
                  style: AppTypography.bodyMd.copyWith(
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          if (outlined)
            OutlinedButton(
              onPressed: () {},
              child: Text(buttonLabel),
            )
          else
            FilledButton(
              onPressed: () {},
              child: Text(buttonLabel),
            ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            recommended ? 'EVERYTHING IN BASIC, PLUS' : "WHAT'S INCLUDED",
            style: AppTypography.labelSm.copyWith(
              color: AppColors.onSurfaceVariant,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          for (final feature in features)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.sm),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.check_circle,
                    size: 20,
                    color: AppColors.primary,
                  ),
                  const SizedBox(width: AppSpacing.xs),
                  Expanded(child: Text(feature, style: AppTypography.bodyMd)),
                ],
              ),
            ),
        ],
      ),
    );

    return recommended ? GlassCard(padding: EdgeInsets.zero, child: card) : card;
  }
}
