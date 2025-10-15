import 'package:flutter/material.dart';
import 'package:adhyan/core/constants/app_colors.dart';
import 'package:adhyan/core/constants/app_sizes.dart';
import 'package:adhyan/core/constants/app_strings.dart';
import 'package:adhyan/core/widgets/custom_button.dart';

/// Loading widget with circular progress indicator
class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          if (message != null) ...[
            const SizedBox(height: AppSizes.space),
            Text(
              message!,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}

/// Error widget with retry button
class ErrorWidget extends StatelessWidget {
  const ErrorWidget({required this.message, super.key, this.onRetry});

  final String message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.paddingXL),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: AppSizes.iconXXL,
              color: AppColors.error,
            ),
            const SizedBox(height: AppSizes.space),
            Text(
              message,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: AppSizes.spaceXL),
              CustomButton(
                onPressed: onRetry,
                text: AppStrings.retry,
                icon: Icons.refresh,
                width: 200,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Empty state widget
class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({
    required this.message,
    super.key,
    this.icon,
    this.actionButton,
  });

  final String message;
  final IconData? icon;
  final Widget? actionButton;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.paddingXL),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon ?? Icons.inbox_outlined,
              size: AppSizes.iconXXL,
              color: AppColors.textSecondary,
            ),
            const SizedBox(height: AppSizes.space),
            Text(
              message,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary),
              textAlign: TextAlign.center,
            ),
            if (actionButton != null) ...[
              const SizedBox(height: AppSizes.spaceXL),
              actionButton!,
            ],
          ],
        ),
      ),
    );
  }
}

/// No internet connection widget
class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({super.key, this.onRetry});

  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return ErrorWidget(
      message: AppStrings.noInternetConnection,
      onRetry: onRetry,
    );
  }
}
