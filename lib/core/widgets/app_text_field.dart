import 'package:flutter/material.dart';

import 'package:grap/core/theme/app_colors.dart';
import 'package:grap/core/theme/app_spacing.dart';
import 'package:grap/core/theme/app_typography.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    required this.label,
    super.key,
    this.controller,
    this.hint,
    this.icon,
    this.obscureText = false,
    this.keyboardType,
    this.maxLines = 1,
    this.suffix,
  });

  final String label;
  final TextEditingController? controller;
  final String? hint;
  final IconData? icon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final int maxLines;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTypography.labelMd,
        ),
        const SizedBox(height: AppSpacing.xs),
        TextField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          maxLines: maxLines,
          style: AppTypography.bodyMd,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: icon != null
                ? Icon(icon, size: 20, color: AppColors.outline)
                : null,
            suffix: suffix,
          ),
        ),
      ],
    );
  }
}

class FilterChipRow extends StatelessWidget {
  const FilterChipRow({
    required this.labels,
    required this.selectedIndex,
    required this.onSelected,
    super.key,
  });

  final List<String> labels;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var i = 0; i < labels.length; i++) ...[
            if (i > 0) const SizedBox(width: AppSpacing.sm),
            FilterChip(
              label: Text(labels[i]),
              selected: selectedIndex == i,
              onSelected: (_) => onSelected(i),
              selectedColor: AppColors.primaryContainer.withValues(alpha: 0.1),
              checkmarkColor: AppColors.primary,
              labelStyle: AppTypography.labelMd.copyWith(
                color: selectedIndex == i
                    ? AppColors.primary
                    : AppColors.onSurfaceVariant,
              ),
              side: BorderSide(
                color: selectedIndex == i
                    ? AppColors.primary.withValues(alpha: 0.2)
                    : AppColors.surfaceContainer,
              ),
              backgroundColor: selectedIndex == i
                  ? AppColors.primaryContainer.withValues(alpha: 0.1)
                  : AppColors.surfaceContainer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(999),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class PromptChipRow extends StatelessWidget {
  const PromptChipRow({
    required this.labels,
    super.key,
    this.onTap,
  });

  final List<String> labels;
  final ValueChanged<String>? onTap;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.xs,
      runSpacing: AppSpacing.xs,
      children: labels
          .map(
            (label) => ActionChip(
              label: Text(
                label,
                style: AppTypography.labelSm.copyWith(color: AppColors.primary),
              ),
              backgroundColor: AppColors.primary.withValues(alpha: 0.05),
              side: BorderSide.none,
              onPressed: onTap != null ? () => onTap!(label) : null,
            ),
          )
          .toList(),
    );
  }
}
