import 'package:flutter/material.dart';
import 'package:adhyan/core/constants/app_colors.dart';
import 'package:adhyan/core/constants/app_sizes.dart';
import 'package:adhyan/core/constants/app_strings.dart';

/// Today's schedule widget showing classes
class TodayScheduleWidget extends StatelessWidget {
  const TodayScheduleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.todaySchedule,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(AppStrings.viewAll),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.space),
          SizedBox(
            height: 140,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _ScheduleCard(
                  subject: 'Mathematics',
                  teacher: 'Mr. Sharma',
                  time: '9:00 - 10:00 AM',
                  color: AppColors.primary,
                  isCompleted: true,
                ),
                _ScheduleCard(
                  subject: 'Physics',
                  teacher: 'Mrs. Gupta',
                  time: '10:00 - 11:00 AM',
                  color: AppColors.secondary,
                  isCurrent: true,
                ),
                _ScheduleCard(
                  subject: 'English',
                  teacher: 'Ms. Verma',
                  time: '11:30 AM - 12:30 PM',
                  color: AppColors.accent,
                ),
                _ScheduleCard(
                  subject: 'Chemistry',
                  teacher: 'Mr. Patel',
                  time: '1:30 - 2:30 PM',
                  color: AppColors.info,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ScheduleCard extends StatelessWidget {
  const _ScheduleCard({
    required this.subject,
    required this.teacher,
    required this.time,
    required this.color,
    this.isCompleted = false,
    this.isCurrent = false,
  });

  final String subject;
  final String teacher;
  final String time;
  final Color color;
  final bool isCompleted;
  final bool isCurrent;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      margin: const EdgeInsets.only(right: AppSizes.spaceM),
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSizes.radiusL),
        child: Stack(
          children: [
            // Colored Accent Bar on Left
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: Container(
                width: 5,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [color, color.withOpacity(0.6)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),

            // Content
            Padding(
              padding: const EdgeInsets.all(AppSizes.paddingL),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Subject and Status Tag
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          subject,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.textPrimary,
                              ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: AppSizes.spaceS),
                      // Status Tag
                      if (isCurrent)
                        _StatusTag(
                          label: 'Live',
                          color: AppColors.success,
                          icon: Icons.circle,
                          iconSize: 8,
                        )
                      else if (isCompleted)
                        _StatusTag(
                          label: 'Done',
                          color: AppColors.textSecondary,
                          icon: Icons.check_circle_rounded,
                          iconSize: 14,
                        )
                      else
                        _StatusTag(
                          label: 'Upcoming',
                          color: AppColors.info,
                          icon: Icons.schedule_rounded,
                          iconSize: 14,
                        ),
                    ],
                  ),

                  const SizedBox(height: AppSizes.spaceS),

                  // Teacher
                  Row(
                    children: [
                      Icon(
                        Icons.person_outline_rounded,
                        size: AppSizes.iconXS,
                        color: color,
                      ),
                      const SizedBox(width: AppSizes.spaceXS),
                      Expanded(
                        child: Text(
                          teacher,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: AppColors.textSecondary,
                                fontWeight: FontWeight.w500,
                              ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  // Time with icon
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.paddingS,
                      vertical: AppSizes.paddingXS,
                    ),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(AppSizes.radiusS),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.access_time_rounded,
                          size: AppSizes.iconXS,
                          color: color,
                        ),
                        const SizedBox(width: AppSizes.spaceXS),
                        Text(
                          time,
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: color,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Status tag widget for schedule cards
class _StatusTag extends StatelessWidget {
  const _StatusTag({
    required this.label,
    required this.color,
    required this.icon,
    this.iconSize = 12,
  });

  final String label;
  final Color color;
  final IconData icon;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.paddingS,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppSizes.radiusS),
        border: Border.all(color: color.withOpacity(0.3), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: iconSize, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
