import 'package:flutter/material.dart';
import 'package:adhyan/core/constants/app_colors.dart';
import 'package:adhyan/core/constants/app_sizes.dart';

/// Custom card widget for consistent styling
class CustomCard extends StatelessWidget {
  const CustomCard({
    required this.child,
    super.key,
    this.padding,
    this.margin,
    this.borderRadius,
    this.color,
    this.elevation,
    this.onTap,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? borderRadius;
  final Color? color;
  final double? elevation;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final card = Card(
      margin: margin ?? const EdgeInsets.all(AppSizes.paddingS),
      elevation: elevation ?? AppSizes.cardElevation,
      color: color ?? AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          borderRadius ?? AppSizes.cardRadius,
        ),
      ),
      child: Padding(
        padding: padding ?? const EdgeInsets.all(AppSizes.cardPadding),
        child: child,
      ),
    );

    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(
          borderRadius ?? AppSizes.cardRadius,
        ),
        child: card,
      );
    }

    return card;
  }
}

/// Gradient card widget
class GradientCard extends StatelessWidget {
  const GradientCard({
    required this.child,
    required this.gradient,
    super.key,
    this.padding,
    this.margin,
    this.borderRadius,
    this.onTap,
  });

  final Widget child;
  final Gradient gradient;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? borderRadius;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final card = Container(
      margin: margin ?? const EdgeInsets.all(AppSizes.paddingS),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(
          borderRadius ?? AppSizes.cardRadius,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: padding ?? const EdgeInsets.all(AppSizes.cardPadding),
        child: child,
      ),
    );

    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(
          borderRadius ?? AppSizes.cardRadius,
        ),
        child: card,
      );
    }

    return card;
  }
}
