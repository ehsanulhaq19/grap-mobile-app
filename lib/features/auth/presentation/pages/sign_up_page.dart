import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:grap/core/constants/app_constants.dart';
import 'package:grap/core/theme/app_colors.dart';
import 'package:grap/core/theme/app_spacing.dart';
import 'package:grap/core/theme/app_typography.dart';
import 'package:grap/core/widgets/grap_logo.dart';
import 'package:grap/core/widgets/ambient_background.dart';
import 'package:grap/core/widgets/app_text_field.dart';
import 'package:grap/core/widgets/glass_card.dart';
import 'package:grap/features/auth/domain/entities/auth_credentials.dart';
import 'package:grap/features/auth/presentation/providers/auth_providers.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  var _termsAccepted = false;
  final _nameController = TextEditingController(text: 'Alex Morgan');
  final _emailController = TextEditingController(text: 'alex@company.com');
  final _passwordController = TextEditingController(text: 'password');

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signUp() async {
    final signUp = ref.read(signUpUseCaseProvider);
    await signUp(
      AuthCredentials(
        email: _emailController.text.trim(),
        password: _passwordController.text,
        fullName: _nameController.text.trim(),
      ),
    );
    if (!mounted) return;
    context.go(AppConstants.homeRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AmbientBackground(
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppSpacing.containerMargin),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: GlassCard(
                  padding: const EdgeInsets.all(AppSpacing.xl),
                  borderRadius: AppSpacing.radiusXl,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const GrapLogo(size: GrapLogoSize.large),
                      const SizedBox(height: AppSpacing.xs),
                      Text(
                        "Your sophisticated AI concierge awaits. Let's create your account.",
                        style: AppTypography.bodyMd.copyWith(
                          color: AppColors.onSurfaceVariant,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: AppSpacing.xl),
                      AppTextField(
                        label: 'Full Name',
                        hint: 'Alex Morgan',
                        icon: Icons.person_outline,
                        controller: _nameController,
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      AppTextField(
                        label: 'Work Email',
                        hint: 'alex@company.com',
                        icon: Icons.mail_outline,
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      AppTextField(
                        label: 'Password',
                        hint: '••••••••',
                        icon: Icons.lock_outline,
                        obscureText: true,
                        controller: _passwordController,
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: _termsAccepted,
                            onChanged: (v) =>
                                setState(() => _termsAccepted = v ?? false),
                            activeColor: AppColors.primary,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Text.rich(
                                TextSpan(
                                  text: 'I agree to the ',
                                  style: AppTypography.bodySm.copyWith(
                                    color: AppColors.onSurfaceVariant,
                                  ),
                                  children: const [
                                    TextSpan(
                                      text: 'Terms of Service',
                                      style: TextStyle(
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    TextSpan(text: ' and '),
                                    TextSpan(
                                      text: 'Privacy Policy',
                                      style: TextStyle(
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    TextSpan(text: '.'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      FilledButton(
                        onPressed: _termsAccepted ? _signUp : null,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Create Account'),
                            SizedBox(width: AppSpacing.xs),
                            Icon(Icons.arrow_forward, size: 18),
                          ],
                        ),
                      ),
                      const SizedBox(height: AppSpacing.md),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: AppColors.outlineVariant
                                  .withValues(alpha: 0.5),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.sm,
                            ),
                            child: Text(
                              'OR CONTINUE WITH',
                              style: AppTypography.labelSm.copyWith(
                                color: AppColors.outline,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: AppColors.outlineVariant
                                  .withValues(alpha: 0.5),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSpacing.md),
                      OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.work_outline),
                        label: const Text('Single Sign-On (SSO)'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.onSurface,
                          side: const BorderSide(color: AppColors.outlineVariant),
                          padding: const EdgeInsets.symmetric(
                            vertical: AppSpacing.sm,
                          ),
                        ),
                      ),
                      const SizedBox(height: AppSpacing.xl),
                      Text.rich(
                        TextSpan(
                          text: 'Already have an account? ',
                          style: AppTypography.bodyMd.copyWith(
                            color: AppColors.onSurfaceVariant,
                          ),
                          children: [
                            WidgetSpan(
                              child: GestureDetector(
                                onTap: () =>
                                    context.go(AppConstants.loginRoute),
                                child: Text(
                                  'Sign in instead',
                                  style: AppTypography.bodyMd.copyWith(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
