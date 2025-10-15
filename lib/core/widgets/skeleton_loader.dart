import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:adhyan/core/constants/app_colors.dart';
import 'package:adhyan/core/constants/app_sizes.dart';

/// Skeleton loader for content loading states
class SkeletonLoader extends StatelessWidget {
  const SkeletonLoader({
    super.key,
    this.height = 20,
    this.width = double.infinity,
    this.borderRadius,
  });

  final double height;
  final double width;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.surfaceVariant,
      highlightColor: AppColors.surface,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: AppColors.surfaceVariant,
          borderRadius: BorderRadius.circular(borderRadius ?? AppSizes.radiusS),
        ),
      ),
    );
  }
}

/// Card skeleton loader
class CardSkeletonLoader extends StatelessWidget {
  const CardSkeletonLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(AppSizes.paddingS),
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.cardPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SkeletonLoader(height: 16, width: 120),
            const SizedBox(height: AppSizes.spaceS),
            const SkeletonLoader(height: 14, width: double.infinity),
            const SizedBox(height: AppSizes.spaceS),
            const SkeletonLoader(height: 14, width: 200),
            const SizedBox(height: AppSizes.space),
            Row(
              children: [
                const SkeletonLoader(height: 32, width: 80),
                const SizedBox(width: AppSizes.spaceS),
                const SkeletonLoader(height: 32, width: 80),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// List item skeleton loader
class ListItemSkeletonLoader extends StatelessWidget {
  const ListItemSkeletonLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.padding,
        vertical: AppSizes.paddingS,
      ),
      child: Row(
        children: [
          const SkeletonLoader(
            height: AppSizes.avatar,
            width: AppSizes.avatar,
            borderRadius: AppSizes.radiusCircle,
          ),
          const SizedBox(width: AppSizes.space),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SkeletonLoader(height: 16, width: 150),
                const SizedBox(height: AppSizes.spaceS),
                const SkeletonLoader(height: 14, width: 100),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Grid item skeleton loader
class GridItemSkeletonLoader extends StatelessWidget {
  const GridItemSkeletonLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.paddingM),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SkeletonLoader(
              height: AppSizes.iconXL,
              width: AppSizes.iconXL,
              borderRadius: AppSizes.radiusM,
            ),
            const SizedBox(height: AppSizes.spaceM),
            const SkeletonLoader(height: 14, width: 80),
          ],
        ),
      ),
    );
  }
}

/// Chart skeleton loader
class ChartSkeletonLoader extends StatelessWidget {
  const ChartSkeletonLoader({super.key, this.height = AppSizes.chartHeight});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.cardPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SkeletonLoader(height: 18, width: 150),
            const SizedBox(height: AppSizes.space),
            SkeletonLoader(height: height, width: double.infinity),
          ],
        ),
      ),
    );
  }
}
