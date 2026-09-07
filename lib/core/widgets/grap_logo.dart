import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:grap/core/constants/app_constants.dart';
import 'package:grap/core/theme/app_colors.dart';

enum GrapLogoSize { small, medium, large }

class GrapLogo extends StatelessWidget {
  const GrapLogo({
    super.key,
    this.size = GrapLogoSize.medium,
    this.showWordmark = true,
    this.wordmarkColor,
  });

  final GrapLogoSize size;
  final bool showWordmark;
  final Color? wordmarkColor;

  double get _markSize => switch (size) {
        GrapLogoSize.small => 36,
        GrapLogoSize.medium => 48,
        GrapLogoSize.large => 64,
      };

  double get _wordmarkSize => switch (size) {
        GrapLogoSize.small => 22,
        GrapLogoSize.medium => 28,
        GrapLogoSize.large => 40,
      };

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GrapLogoMark(size: _markSize),
        if (showWordmark) ...[
          SizedBox(width: size == GrapLogoSize.small ? 10 : 12),
          Text(
            AppConstants.logoWordmark,
            style: GoogleFonts.plusJakartaSans(
              fontSize: _wordmarkSize,
              fontWeight: FontWeight.w700,
              color: wordmarkColor ?? AppColors.primary,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ],
    );
  }
}

class GrapLogoMark extends StatelessWidget {
  const GrapLogoMark({super.key, this.size = 48});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primary,
            AppColors.tertiary,
          ],
        ),
        borderRadius: BorderRadius.circular(size * 0.32),
        boxShadow: const [
          BoxShadow(
            color: AppColors.ambientShadow,
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size * 0.12),
          child: Text(
            AppConstants.logoMonogram,
            style: GoogleFonts.plusJakartaSans(
              fontSize: size * 0.48,
              fontWeight: FontWeight.w800,
              color: AppColors.onPrimary,
              height: 1,
            ),
          ),
        ),
      ),
    );
  }
}
