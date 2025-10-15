import 'package:flutter/material.dart';
import 'package:adhyan/core/constants/app_colors.dart';
import 'package:adhyan/core/constants/app_sizes.dart';

/// Custom button widget for consistent styling across the app
class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.onPressed,
    required this.text,
    super.key,
    this.isLoading = false,
    this.isOutlined = false,
    this.icon,
    this.backgroundColor,
    this.foregroundColor,
    this.width,
    this.height = AppSizes.buttonHeight,
  });

  final VoidCallback? onPressed;
  final String text;
  final bool isLoading;
  final bool isOutlined;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? width;
  final double height;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: null,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? AppColors.primary,
          ),
          child: const SizedBox(
            height: AppSizes.progressSizeS,
            width: AppSizes.progressSizeS,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(
                AppColors.textOnPrimary,
              ),
            ),
          ),
        ),
      );
    }

    if (isOutlined) {
      return SizedBox(
        width: width,
        height: height,
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            foregroundColor: foregroundColor ?? AppColors.primary,
            side: BorderSide(
              color: foregroundColor ?? AppColors.primary,
              width: 1.5,
            ),
          ),
          child: icon != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon, size: AppSizes.iconS),
                    const SizedBox(width: AppSizes.spaceS),
                    Text(text),
                  ],
                )
              : Text(text),
        ),
      );
    }

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primary,
          foregroundColor: foregroundColor ?? AppColors.textOnPrimary,
        ),
        child: icon != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, size: AppSizes.iconS),
                  const SizedBox(width: AppSizes.spaceS),
                  Text(text),
                ],
              )
            : Text(text),
      ),
    );
  }
}
