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

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _emailController = TextEditingController(text: 'you@company.com');
  final _passwordController = TextEditingController(text: 'password');

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signIn() async {
    final signIn = ref.read(signInUseCaseProvider);
    await signIn(
      AuthCredentials(
        email: _emailController.text.trim(),
        password: _passwordController.text,
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
                child: Column(
                  children: [
                    const GrapLogo(size: GrapLogoSize.large),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      'Welcome back. Your creative concierge is ready.',
                      style: AppTypography.bodyLg.copyWith(
                        color: AppColors.onSurfaceVariant,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppSpacing.xl),
                    GlassCard(
                      padding: const EdgeInsets.all(AppSpacing.xl),
                      borderRadius: AppSpacing.radiusXl,
                      child: Column(
                        children: [
                          AppTextField(
                            label: 'Email Address',
                            hint: 'you@company.com',
                            icon: Icons.mail_outline,
                            keyboardType: TextInputType.emailAddress,
                            controller: _emailController,
                          ),
                          const SizedBox(height: AppSpacing.lg),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Password',
                                    style: AppTypography.labelMd,
                                  ),
                                  Text(
                                    'Forgot Password?',
                                    style: AppTypography.labelSm.copyWith(
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: AppSpacing.xs),
                              TextField(
                                controller: _passwordController,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  hintText: '••••••••',
                                  prefixIcon: Icon(
                                    Icons.lock_outline,
                                    size: 20,
                                    color: AppColors.outline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: AppSpacing.lg),
                          FilledButton(
                            onPressed: _signIn,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Sign In'),
                                SizedBox(width: AppSpacing.xs),
                                Icon(Icons.arrow_forward, size: 18),
                              ],
                            ),
                          ),
                          const SizedBox(height: AppSpacing.md),
                          Text.rich(
                            TextSpan(
                              text: "Don't have an account? ",
                              style: AppTypography.bodySm.copyWith(
                                color: AppColors.onSurfaceVariant,
                              ),
                              children: [
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.baseline,
                                  baseline: TextBaseline.alphabetic,
                                  child: GestureDetector(
                                    onTap: () =>
                                        context.go(AppConstants.signUpRoute),
                                    child: Text(
                                      'Request access',
                                      style: AppTypography.bodySm.copyWith(
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.w500,
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
