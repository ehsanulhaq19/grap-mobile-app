import 'package:flutter/material.dart';

import 'package:grap/core/theme/app_colors.dart';

class AmbientBackground extends StatelessWidget {
  const AmbientBackground({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -100,
          left: -100,
          child: _Orb(
            size: 500,
            colors: [
              AppColors.primary.withValues(alpha: 0.15),
              AppColors.primaryContainer.withValues(alpha: 0.05),
              Colors.transparent,
            ],
          ),
        ),
        Positioned(
          bottom: -200,
          right: -100,
          child: _Orb(
            size: 600,
            colors: [
              AppColors.tertiaryContainer.withValues(alpha: 0.1),
              AppColors.tertiaryFixed.withValues(alpha: 0.05),
              Colors.transparent,
            ],
          ),
        ),
        child,
      ],
    );
  }
}

class _Orb extends StatelessWidget {
  const _Orb({required this.size, required this.colors});

  final double size;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(colors: colors),
      ),
    );
  }
}
