import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:grap/core/constants/app_constants.dart';
import 'package:grap/core/theme/app_colors.dart';
import 'package:grap/core/theme/app_spacing.dart';
import 'package:grap/core/theme/app_typography.dart';
import 'package:grap/core/widgets/glass_card.dart';
import 'package:grap/core/widgets/glass_app_bar.dart';
import 'package:grap/features/studio/presentation/shell/main_shell.dart';

class UsageBillingPage extends StatelessWidget {
  const UsageBillingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StudioScaffold(
      appBarVariant: AppBarVariant.standard,
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.containerMargin),
        children: [
          Text('Billing & Usage', style: AppTypography.headlineXl),
          const SizedBox(height: AppSpacing.xs),
          Text(
            'Manage your subscription, monitor credit usage, and view payment history.',
            style: AppTypography.bodyLg.copyWith(
              color: AppColors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          _UsageRingCard(),
          const SizedBox(height: AppSpacing.lg),
          _PlanCard(),
          const SizedBox(height: AppSpacing.lg),
          _BillingHistoryCard(),
          const SizedBox(height: AppSpacing.lg),
          _PaymentMethodCard(),
        ],
      ),
    );
  }
}

class _UsageRingCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(AppSpacing.radiusXl),
        boxShadow: const [
          BoxShadow(
            color: AppColors.ambientShadow,
            blurRadius: 20,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Current Cycle Usage',
              style: AppTypography.headlineMd,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          SizedBox(
            width: 160,
            height: 160,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox.expand(
                  child: CircularProgressIndicator(
                    value: 0.75,
                    strokeWidth: 12,
                    backgroundColor: AppColors.surfaceContainerHigh,
                    color: AppColors.primary,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '75%',
                      style: AppTypography.headlineLg.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    Text(
                      'CREDITS USED',
                      style: AppTypography.labelSm.copyWith(
                        color: AppColors.onSurfaceVariant,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '750 / 1,000 Credits',
                style: AppTypography.bodySm.copyWith(
                  color: AppColors.onSurfaceVariant,
                ),
              ),
              Text(
                'Resets in 5 days',
                style: AppTypography.bodySm.copyWith(
                  color: AppColors.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          FilledButton(
            onPressed: () => context.push(AppConstants.subscriptionsRoute),
            child: const Text('Buy More Credits'),
          ),
        ],
      ),
    );
  }
}

class _PlanCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryContainer.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      'PRO PLAN',
                      style: AppTypography.labelSm.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: r'$49.00 ',
                          style: AppTypography.headlineMd,
                        ),
                        TextSpan(
                          text: '/ mo',
                          style: AppTypography.bodySm.copyWith(
                            color: AppColors.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Icon(
                Icons.workspace_premium,
                color: AppColors.primary,
                size: 32,
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          _FeatureLine('1,000 AI Credits per month'),
          _FeatureLine('Advanced Marketing Templates'),
          _FeatureLine('Priority Support'),
          const SizedBox(height: AppSpacing.md),
          OutlinedButton(
            onPressed: () {},
            child: const Text('Manage Subscription'),
          ),
        ],
      ),
    );
  }
}

class _FeatureLine extends StatelessWidget {
  const _FeatureLine(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          const Icon(Icons.check_circle, size: 18, color: AppColors.secondary),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: AppTypography.bodySm.copyWith(
                color: AppColors.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BillingHistoryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(AppSpacing.radiusXl),
        boxShadow: const [
          BoxShadow(
            color: AppColors.ambientShadow,
            blurRadius: 20,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Billing History', style: AppTypography.headlineMd),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.download, size: 18),
                  label: const Text('Download All'),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          _TransactionTile(
            title: 'Pro Plan - Monthly',
            invoice: 'Invoice #INV-2023-09',
            amount: r'$49.00',
            date: 'Oct 1, 2023',
          ),
          _TransactionTile(
            title: 'Pro Plan - Monthly',
            invoice: 'Invoice #INV-2023-08',
            amount: r'$49.00',
            date: 'Sep 1, 2023',
          ),
          _TransactionTile(
            title: 'Credit Top-up (500)',
            invoice: 'Invoice #INV-2023-08-T',
            amount: r'$15.00',
            date: 'Aug 15, 2023',
            icon: Icons.add_shopping_cart,
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: TextButton(
              onPressed: () {},
              child: const Text('View Older Transactions'),
            ),
          ),
        ],
      ),
    );
  }
}

class _TransactionTile extends StatelessWidget {
  const _TransactionTile({
    required this.title,
    required this.invoice,
    required this.amount,
    required this.date,
    this.icon = Icons.receipt_long,
  });

  final String title;
  final String invoice;
  final String amount;
  final String date;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.surfaceVariant,
            child: Icon(icon, color: AppColors.onSurface),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTypography.bodyMd.copyWith(
                  fontWeight: FontWeight.w500,
                )),
                Text(
                  invoice,
                  style: AppTypography.bodySm.copyWith(
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(amount, style: AppTypography.bodyMd.copyWith(
                fontWeight: FontWeight.w500,
              )),
              Text(
                date,
                style: AppTypography.bodySm.copyWith(
                  color: AppColors.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PaymentMethodCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(AppSpacing.radiusXl),
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
          Text('Payment Method', style: AppTypography.headlineMd),
          const SizedBox(height: AppSpacing.xs),
          Text(
            'Your default payment method for subscriptions and top-ups.',
            style: AppTypography.bodySm.copyWith(
              color: AppColors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.surfaceVariant.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
              border: Border.all(
                color: AppColors.outlineVariant.withValues(alpha: 0.3),
              ),
            ),
            child: Row(
              children: [
                const Icon(Icons.credit_card, color: AppColors.onSurfaceVariant),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Visa ending in 4242',
                        style: AppTypography.bodySm.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Expires 12/25',
                        style: AppTypography.labelSm.copyWith(
                          color: AppColors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(onPressed: () {}, child: const Text('Edit')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
