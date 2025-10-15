import 'package:flutter/material.dart';
import 'package:adhyan/core/constants/app_colors.dart';
import 'package:adhyan/core/constants/app_sizes.dart';
import 'package:adhyan/core/constants/app_strings.dart';

/// Action grid widget with quick access to major features - Modern Design
class ActionGridWidget extends StatelessWidget {
  const ActionGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: AppSizes.spaceM,
      crossAxisSpacing: AppSizes.spaceM,
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding),
      childAspectRatio: 0.85,
      children: [
        _ModernActionItem(
          icon: Icons.quiz_rounded,
          label: AppStrings.tests,
          gradientColors: [AppColors.primary, AppColors.primaryLight],
          onTap: () {},
        ),
        _ModernActionItem(
          icon: Icons.videogame_asset_rounded,
          label: AppStrings.games,
          gradientColors: [AppColors.accent, AppColors.accentLight],
          onTap: () {},
        ),
        _ModernActionItem(
          icon: Icons.insights_rounded,
          label: AppStrings.performance,
          gradientColors: [AppColors.success, AppColors.secondaryLight],
          onTap: () {},
        ),
        _ModernActionItem(
          icon: Icons.emoji_events_rounded,
          label: AppStrings.leaderboard,
          gradientColors: [const Color(0xFFEC4899), const Color(0xFFF472B6)],
          onTap: () {},
        ),
        _ModernActionItem(
          icon: Icons.rocket_launch_rounded,
          label: AppStrings.careerGuide,
          gradientColors: [AppColors.info, const Color(0xFF60A5FA)],
          onTap: () {},
        ),
        _ModernActionItem(
          icon: Icons.menu_book_rounded,
          label: AppStrings.syllabus,
          gradientColors: [AppColors.secondary, AppColors.secondaryLight],
          onTap: () {},
        ),
        _ModernActionItem(
          icon: Icons.calendar_today_rounded,
          label: AppStrings.timetable,
          gradientColors: [const Color(0xFF8B5CF6), const Color(0xFFA78BFA)],
          onTap: () {},
        ),
        _ModernActionItem(
          icon: Icons.payments_rounded,
          label: AppStrings.feeStatus,
          gradientColors: [AppColors.accentDark, AppColors.accent],
          onTap: () {},
        ),
      ],
    );
  }
}

class _ModernActionItem extends StatelessWidget {
  const _ModernActionItem({
    required this.icon,
    required this.label,
    required this.gradientColors,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final List<Color> gradientColors;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppSizes.radiusL),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow.withOpacity(0.06),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Gradient Icon Container
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: gradientColors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(AppSizes.radiusM),
                boxShadow: [
                  BoxShadow(
                    color: gradientColors[0].withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(icon, size: AppSizes.iconM, color: Colors.white),
            ),
            const SizedBox(height: AppSizes.spaceS),
            // Label
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.paddingXS,
              ),
              child: Text(
                label,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
