import 'package:flutter/material.dart';

import 'package:grap/core/theme/app_colors.dart';
import 'package:grap/core/theme/app_spacing.dart';
import 'package:grap/core/theme/app_typography.dart';
import 'package:grap/core/widgets/ai_gradient_button.dart';
import 'package:grap/core/widgets/app_text_field.dart';
import 'package:grap/features/studio/presentation/shell/main_shell.dart';

class ContentGenerationPage extends StatefulWidget {
  const ContentGenerationPage({super.key});

  @override
  State<ContentGenerationPage> createState() => _ContentGenerationPageState();
}

class _ContentGenerationPageState extends State<ContentGenerationPage> {
  var _micActive = false;

  @override
  Widget build(BuildContext context) {
    return StudioScaffold(
      body: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.containerMargin,
          AppSpacing.lg,
          AppSpacing.containerMargin,
          AppSpacing.xxl,
        ),
        children: [
          RichText(
            text: TextSpan(
              style: AppTypography.headlineLgMobile,
              children: [
                const TextSpan(text: 'What shall we '),
                TextSpan(
                  text: 'create',
                  style: AppTypography.headlineLgMobile.copyWith(
                    foreground: Paint()
                      ..shader = const LinearGradient(
                        colors: [AppColors.primary, AppColors.tertiary],
                      ).createShader(const Rect.fromLTWH(0, 0, 200, 40)),
                  ),
                ),
                const TextSpan(text: ' today?'),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            "Describe your needs below, or simply tap the microphone and speak your thoughts. I'll craft the perfect response for you.",
            style: AppTypography.bodyMd.copyWith(
              color: AppColors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.md),
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
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const PromptChipRow(
                      labels: ['Blog Post', 'Social Copy', 'Email Campaign'],
                    ),
                    const Divider(height: AppSpacing.lg),
                    TextField(
                      maxLines: 8,
                      style: AppTypography.bodyLg,
                      decoration: InputDecoration(
                        hintText:
                            'E.g., Write a compelling LinkedIn post about the future of AI in marketing...',
                        hintStyle: AppTypography.bodyLg.copyWith(
                          color: AppColors.onSurfaceVariant
                              .withValues(alpha: 0.5),
                        ),
                        border: InputBorder.none,
                        filled: false,
                      ),
                    ),
                    const Divider(height: AppSpacing.lg),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.attach_file),
                              color: AppColors.onSurfaceVariant,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.style_outlined),
                              color: AppColors.onSurfaceVariant,
                            ),
                          ],
                        ),
                        Text(
                          '0 / 2000',
                          style: AppTypography.labelSm.copyWith(
                            color:
                                AppColors.onSurfaceVariant.withValues(alpha: 0.5),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                right: -8,
                bottom: -8,
                child: Material(
                  color: AppColors.surface,
                  elevation: 8,
                  shape: const CircleBorder(
                    side: BorderSide(color: AppColors.outlineVariant),
                  ),
                  child: InkWell(
                    onTap: () => setState(() => _micActive = !_micActive),
                    customBorder: const CircleBorder(),
                    child: Container(
                      width: 56,
                      height: 56,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _micActive
                            ? AppColors.primary.withValues(alpha: 0.1)
                            : AppColors.surface,
                      ),
                      child: Icon(
                        Icons.mic,
                        size: 28,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xl),
          Row(
            children: [
              Expanded(
                child: SecondaryOutlineButton(
                  label: 'Save Draft',
                  icon: Icons.save_outlined,
                  onPressed: () {},
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: AiGradientButton(
                  label: 'Generate Content',
                  icon: Icons.auto_awesome,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
