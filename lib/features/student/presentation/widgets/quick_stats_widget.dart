import 'package:flutter/material.dart';
import 'package:adhyan/core/constants/app_colors.dart';
import 'package:adhyan/core/constants/app_sizes.dart';

/// Quick stats widget showing attendance and pending work with modern metrics
class QuickStatsWidget extends StatelessWidget {
  const QuickStatsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding),
      child: Row(
        children: [
          // Attendance Card
          Expanded(
            child: _ModernStatCard(
              title: "Today's Attendance",
              mainValue: '95%',
              mainValueColor: AppColors.success,
              subtitle: 'This Month',
              icon: Icons.check_circle_rounded,
              iconBackgroundColor: AppColors.success.withOpacity(0.1),
              iconColor: AppColors.success,
              progressValue: 0.95,
              showProgress: true,
            ),
          ),
          const SizedBox(width: AppSizes.spaceM),
          // Assignments Card
          Expanded(
            child: _ModernStatCard(
              title: 'Pending',
              mainValue: '3',
              mainValueColor: AppColors.warning,
              subtitle: '2 due tomorrow',
              icon: Icons.assignment_late_rounded,
              iconBackgroundColor: AppColors.warning.withOpacity(0.1),
              iconColor: AppColors.warning,
              showWarningBadge: true,
            ),
          ),
        ],
      ),
    );
  }
}

class _ModernStatCard extends StatelessWidget {
  const _ModernStatCard({
    required this.title,
    required this.mainValue,
    required this.mainValueColor,
    required this.subtitle,
    required this.icon,
    required this.iconBackgroundColor,
    required this.iconColor,
    this.progressValue,
    this.showProgress = false,
    this.showWarningBadge = false,
  });

  final String title;
  final String mainValue;
  final Color mainValueColor;
  final String subtitle;
  final IconData icon;
  final Color iconBackgroundColor;
  final Color iconColor;
  final double? progressValue;
  final bool showProgress;
  final bool showWarningBadge;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.paddingL),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusL),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title Row with Icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              if (showWarningBadge)
                Container(
                  padding: const EdgeInsets.all(AppSizes.paddingXS),
                  decoration: BoxDecoration(
                    color: iconBackgroundColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.warning_rounded,
                    color: iconColor,
                    size: AppSizes.iconS,
                  ),
                ),
            ],
          ),

          const SizedBox(height: AppSizes.spaceM),

          // Large Main Value
          Text(
            mainValue,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              color: mainValueColor,
              fontWeight: FontWeight.w700,
              fontSize: 36,
            ),
          ),

          const SizedBox(height: AppSizes.spaceXS),

          // Subtitle with highlight
          Row(
            children: [
              if (showWarningBadge)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.paddingS,
                    vertical: AppSizes.paddingXS,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.warning.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(AppSizes.radiusS),
                  ),
                  child: Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.warning,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              else
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
            ],
          ),

          // Progress Bar
          if (showProgress && progressValue != null) ...[
            const SizedBox(height: AppSizes.spaceM),
            ClipRRect(
              borderRadius: BorderRadius.circular(AppSizes.radiusS),
              child: LinearProgressIndicator(
                value: progressValue,
                minHeight: 6,
                backgroundColor: AppColors.surfaceVariant,
                valueColor: AlwaysStoppedAnimation<Color>(mainValueColor),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
