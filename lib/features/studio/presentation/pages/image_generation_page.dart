import 'package:flutter/material.dart';

import 'package:grap/core/theme/app_colors.dart';
import 'package:grap/core/theme/app_spacing.dart';
import 'package:grap/core/theme/app_typography.dart';
import 'package:grap/core/widgets/ai_gradient_button.dart';
import 'package:grap/features/studio/presentation/shell/main_shell.dart';

class ImageGenerationPage extends StatefulWidget {
  const ImageGenerationPage({super.key});

  @override
  State<ImageGenerationPage> createState() => _ImageGenerationPageState();
}

class _ImageGenerationPageState extends State<ImageGenerationPage> {
  var _selectedStyle = 0;
  var _selectedRatio = 0;

  static const _styles = [
    ('Cinematic', 'https://lh3.googleusercontent.com/aida-public/AB6AXuAV--lVwZKAUlWzMUasHyx9izHJpbvkROyN6G2a2on1gZyPV-ilp_dk36ZEMFx46dV_-7Yf9BY_Fnu9oL8wpCFyTg1ZqFqQxARc4ES9Xqq2WGy5TQRb1PVelRVJ74CBsKl1FhlEeA9pfAECerbFJfSf1sR7vJDzUR-xOgDuIz8rOiEKKkI_nbxwBMy6rMQI9Bra1qf72BzQOVmRA9qZ0_-4nVkbpZnqiPnQJfdyvajUjfwuxDpzVf-HFQ'),
    ('Minimalist', 'https://lh3.googleusercontent.com/aida-public/AB6AXuCbg3l2fOe0fbbRq1uqZI3AytNBeC5LpnyDyhdHXDxWNP3pCImoXBGs2i9mD9A3oldANbVgVsBOgihe0GnYGXvVIEf9uHvawevSU5Bn_L_H-1qXCYcIv5emOQP9VxS2SYVDcryyoFf9l9PK22ZdGStsVy89c5OMFre5NCkn1eD6HQThVPGc3zRD-OFkYe3J6P_ez-zOwpAcoyiMXwIW6fo3Qy-COgvuwOveF74QlU5VcbRB3TqdEIVoFA'),
    ('Fantasy Art', 'https://lh3.googleusercontent.com/aida-public/AB6AXuDuA8T_PndluP1F02IaoGARGDe3wZtpbMLs0b3menL-YMW5fl8cvB-0iPWbZsSvnLphQVIewdq2rt7kmh7n9zhxC8uMZ0ZBWABm_hIQHecDePGRzzMRgFSB3t9HCKdEkSQNn7AkMRFO8bQHyw_xzXddgDCwP-IH2E9aPKR82gDjyUkSPO0abYNG26uDbIOlhb7NHYcpQmRlJ3C1j6JHrvoImDNQGTZ0NUhOJ6MYppfhZl7WZ5_02Vi8EA'),
    ('Vector', 'https://lh3.googleusercontent.com/aida-public/AB6AXuC1gB7tIPS_WiDB5izWlpcHbz_3T7LHBoMqFi7D-fKNAU8hVdOflb5vQdftAr4mmzlpjWdiOcmn6XQmvBn2lwR-KQetIXXGQcz4afk0bl49RHvOvYiZVHWYaRbuPONeQkB22kfSET_F8Vj69qGz1XPJK6dd95nqPBUnsa5_qxw2FhtxzYSLkJKNCRTVuP17Q35HeLSRsCYqB9YAmS2TfBZQfk9UbwpQrh_7EvEPk0BANPOknqOGHTTXeA'),
    ('Photoreal', 'https://lh3.googleusercontent.com/aida-public/AB6AXuACHXfgrlN37f0nzYSJpZA3hYEXMJ9bgr3lLC24s8lhABVym32Lh_-NCq8zgATT8KYKWJ69mKFD9ZRspwzLeSyspZu02_aSoZVfvcrv_rL4Q8NK8QBiBJ2ywTaL4K3LZT-Im-XbUcBr9NHsObPHzmH5HeBapUmJSroCmpewpZMGxh4yEXuphFEMsahTZv9e6YGcKm1ZbAROl1nxAYYkiz6yy80OSVS1CzPaQwb7OCVVsrdh-epzi34gJQ'),
  ];

  @override
  Widget build(BuildContext context) {
    return StudioScaffold(
      body: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.containerMargin,
          AppSpacing.lg,
          AppSpacing.containerMargin,
          120,
        ),
        children: [
          Text('Create Image', style: AppTypography.headlineLgMobile),
          const SizedBox(height: AppSpacing.xs),
          Text(
            'Describe what you want to see, and let AI do the rest.',
            style: AppTypography.bodyMd.copyWith(
              color: AppColors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
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
                Stack(
                  children: [
                    TextField(
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText:
                            'Describe the image you want to generate in detail...',
                        hintStyle: AppTypography.bodyMd.copyWith(
                          color: AppColors.onSurfaceVariant
                              .withValues(alpha: 0.5),
                        ),
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(AppSpacing.radiusXl),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 8,
                      bottom: 8,
                      child: Row(
                        children: [
                          _RoundIconButton(icon: Icons.mic),
                          const SizedBox(width: 8),
                          _RoundIconButton(icon: Icons.casino_outlined),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.md),
                Container(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerLow.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                    border: Border.all(
                      color: AppColors.outlineVariant.withValues(alpha: 0.4),
                      style: BorderStyle.solid,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.upload_file,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Text(
                        'Upload a reference image',
                        style: AppTypography.labelMd,
                      ),
                      Text(
                        'PNG, JPG up to 10MB',
                        style: AppTypography.bodySm.copyWith(
                          color: AppColors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Visual Style',
                style: AppTypography.bodyLg.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'See all',
                style: AppTypography.labelSm.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          SizedBox(
            height: 130,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _styles.length,
              separatorBuilder: (_, __) => const SizedBox(width: AppSpacing.md),
              itemBuilder: (context, index) {
                final selected = _selectedStyle == index;
                return GestureDetector(
                  onTap: () => setState(() => _selectedStyle = index),
                  child: Column(
                    children: [
                      Container(
                        width: 112,
                        height: 112,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(AppSpacing.radiusXl),
                          border: Border.all(
                            color: selected
                                ? AppColors.primary
                                : AppColors.outlineVariant
                                    .withValues(alpha: 0.3),
                            width: selected ? 2 : 1,
                          ),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.network(_styles[index].$2, fit: BoxFit.cover),
                            if (selected)
                              Container(
                                color: AppColors.primary.withValues(alpha: 0.2),
                                child: const Center(
                                  child: CircleAvatar(
                                    radius: 12,
                                    backgroundColor: AppColors.primary,
                                    child: Icon(
                                      Icons.check,
                                      size: 16,
                                      color: AppColors.onPrimary,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _styles[index].$1,
                        style: AppTypography.labelSm.copyWith(
                          color: selected
                              ? AppColors.primary
                              : AppColors.onSurfaceVariant,
                          fontWeight:
                              selected ? FontWeight.w600 : FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            'AI Model',
            style: AppTypography.labelSm.copyWith(
              color: AppColors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          DropdownButtonFormField<String>(
            initialValue: 'GRAP Vision V3 (Fast)',
            items: const [
              DropdownMenuItem(
                value: 'GRAP Vision V3 (Fast)',
                child: Text('GRAP Vision V3 (Fast)'),
              ),
              DropdownMenuItem(
                value: 'GRAP Vision Pro (High Detail)',
                child: Text('GRAP Vision Pro (High Detail)'),
              ),
              DropdownMenuItem(
                value: 'GRAP DALL-E 3',
                child: Text('GRAP DALL-E 3'),
              ),
            ],
            onChanged: (_) {},
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            'Aspect Ratio',
            style: AppTypography.labelSm.copyWith(
              color: AppColors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Row(
            children: [
              for (var i = 0; i < 3; i++)
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: i < 2 ? 8 : 0),
                    child: ChoiceChip(
                      label: Text(['1:1', '16:9', '9:16'][i]),
                      selected: _selectedRatio == i,
                      onSelected: (_) => setState(() => _selectedRatio = i),
                      selectedColor:
                          AppColors.primaryContainer.withValues(alpha: 0.1),
                      labelStyle: AppTypography.labelMd.copyWith(
                        color: _selectedRatio == i
                            ? AppColors.primary
                            : AppColors.onSurfaceVariant,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: AppSpacing.xl),
          AiGradientButton(
            label: 'Generate Image',
            icon: Icons.auto_awesome,
            trailing: Text(
              '2 Credits',
              style: AppTypography.labelSm.copyWith(
                color: AppColors.onPrimary.withValues(alpha: 0.8),
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _RoundIconButton extends StatelessWidget {
  const _RoundIconButton({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: AppColors.surfaceContainer,
      child: Icon(icon, size: 20, color: AppColors.onSurfaceVariant),
    );
  }
}
