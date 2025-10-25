import 'package:flutter/material.dart';
import 'package:adhyan/core/constants/app_colors.dart';
import 'package:adhyan/core/constants/app_sizes.dart';
import 'package:adhyan/core/constants/app_strings.dart';

/// Parent Dashboard - Main home screen for parents
class ParentDashboard extends StatefulWidget {
  const ParentDashboard({super.key});

  @override
  State<ParentDashboard> createState() => _ParentDashboardState();
}

class _ParentDashboardState extends State<ParentDashboard> {
  String _selectedChild = 'Rahul Kumar';
  final List<String> _children = ['Rahul Kumar', 'Priya Kumar'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceLight,
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1));
        },
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            // Modern App Bar with Child Selector
            SliverAppBar(
              expandedHeight: 180,
              pinned: true,
              backgroundColor: const Color(
                0xFF0F766E,
              ), // Teal for professional look
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF0F766E), Color(0xFF14B8A6)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.paddingXL,
                        vertical: AppSizes.paddingL,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Parent Dashboard',
                            style: Theme.of(context).textTheme.headlineMedium
                                ?.copyWith(
                                  color: AppColors.textOnPrimary,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                          const SizedBox(height: AppSizes.spaceL),
                          // Modern Child Selector
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSizes.paddingM,
                              vertical: AppSizes.paddingXS,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                AppSizes.radiusL,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: _selectedChild,
                                isExpanded: true,
                                icon: const Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  size: 24,
                                ),
                                items: _children.map((child) {
                                  return DropdownMenuItem(
                                    value: child,
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 16,
                                          backgroundColor: const Color(
                                            0xFF0F766E,
                                          ).withOpacity(0.1),
                                          child: const Icon(
                                            Icons.person_rounded,
                                            size: 18,
                                            color: Color(0xFF0F766E),
                                          ),
                                        ),
                                        const SizedBox(width: AppSizes.spaceM),
                                        Text(
                                          child,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _selectedChild = value!;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              actions: [
                Stack(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.notifications_rounded),
                      onPressed: () {},
                    ),
                    Positioned(
                      right: 10,
                      top: 10,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: AppColors.error,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: AppSizes.spaceS),
              ],
            ),

            // Content
            SliverToBoxAdapter(
              child: SafeArea(
                bottom: true,
                child: Padding(
                  // Ensure there's extra bottom padding to avoid bottom overflow on
                  // small devices or when system UI (nav bars) are present.
                  padding: EdgeInsets.only(
                    bottom:
                        MediaQuery.of(context).viewPadding.bottom +
                        AppSizes.padding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: AppSizes.spaceL),

                      // Quick Overview Cards with Modern Design
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.padding,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Quick Overview',
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.textPrimary,
                                  ),
                            ),
                            const SizedBox(height: AppSizes.space),
                            // Grid of 4 Overview Cards
                            GridView.count(
                              crossAxisCount: 2,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              mainAxisSpacing: AppSizes.spaceM,
                              crossAxisSpacing: AppSizes.spaceM,
                              childAspectRatio: 1.5,
                              children: [
                                _ModernOverviewCard(
                                  title: AppStrings.attendance,
                                  value: '95%',
                                  icon: Icons.calendar_today_rounded,
                                  gradientColors: const [
                                    AppColors.success,
                                    Color(0xFF34D399),
                                  ],
                                  subtitle: 'This month',
                                ),
                                _ModernOverviewCard(
                                  title: 'Performance',
                                  value: '85%',
                                  icon: Icons.trending_up_rounded,
                                  gradientColors: const [
                                    AppColors.info,
                                    Color(0xFF60A5FA),
                                  ],
                                  subtitle: 'Average score',
                                  showBadge: false,
                                ),
                                _ModernOverviewCard(
                                  title: AppStrings.fees,
                                  value: '₹5,000',
                                  icon: Icons.payments_rounded,
                                  gradientColors: const [
                                    AppColors.warning,
                                    Color(0xFFFBBF24),
                                  ],
                                  subtitle: 'Due on 15 Oct',
                                  showBadge: true,
                                  badgeText: 'DUE',
                                ),
                                _ModernOverviewCard(
                                  title: 'Messages',
                                  value: '3',
                                  icon: Icons.chat_bubble_rounded,
                                  gradientColors: const [
                                    Color(0xFF8B5CF6),
                                    Color(0xFFA78BFA),
                                  ],
                                  subtitle: 'New',
                                  showBadge: true,
                                  badgeText: 'NEW',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: AppSizes.spaceXXL),

                      // Action Grid
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.padding,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.quickActions,
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.textPrimary,
                                  ),
                            ),
                            const SizedBox(height: AppSizes.space),
                            GridView.count(
                              crossAxisCount: 3,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              mainAxisSpacing: AppSizes.spaceM,
                              crossAxisSpacing: AppSizes.spaceM,
                              children: [
                                _ParentActionItem(
                                  icon: Icons.calendar_today_rounded,
                                  label: AppStrings.attendance,
                                  color: AppColors.success,
                                ),
                                _ParentActionItem(
                                  icon: Icons.insights_rounded,
                                  label: AppStrings.performance,
                                  color: AppColors.info,
                                ),
                                _ParentActionItem(
                                  icon: Icons.payments_rounded,
                                  label: AppStrings.fees,
                                  color: AppColors.warning,
                                ),
                                _ParentActionItem(
                                  icon: Icons.chat_bubble_rounded,
                                  label: AppStrings.messages,
                                  color: const Color(0xFF8B5CF6),
                                ),
                                _ParentActionItem(
                                  icon: Icons.school_rounded,
                                  label: AppStrings.schoolInfo,
                                  color: AppColors.secondary,
                                ),
                                _ParentActionItem(
                                  icon: Icons.report_rounded,
                                  label: AppStrings.complaints,
                                  color: AppColors.error,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: AppSizes.spaceL),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Modern overview card for parent dashboard
class _ModernOverviewCard extends StatelessWidget {
  const _ModernOverviewCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.gradientColors,
    required this.subtitle,
    this.showBadge = false,
    this.badgeText,
  });

  final String title;
  final String value;
  final IconData icon;
  final List<Color> gradientColors;
  final String subtitle;
  final bool showBadge;
  final String? badgeText;

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
          // Icon with gradient background
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(AppSizes.paddingS),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: gradientColors,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(AppSizes.radiusM),
                ),
                child: Icon(icon, color: Colors.white, size: AppSizes.iconM),
              ),
              if (showBadge && badgeText != null)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.paddingS,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: gradientColors[0].withOpacity(0.1),
                    borderRadius: BorderRadius.circular(AppSizes.radiusS),
                    border: Border.all(color: gradientColors[0], width: 1),
                  ),
                  child: Text(
                    badgeText!,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: gradientColors[0],
                    ),
                  ),
                ),
            ],
          ),

          const Spacer(),

          // Title
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: AppSizes.spaceXS),

          // Value
          Text(
            value,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),

          const SizedBox(height: AppSizes.spaceXS),

          // Subtitle
          Text(
            subtitle,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}

class _ParentActionItem extends StatelessWidget {
  const _ParentActionItem({
    required this.icon,
    required this.label,
    required this.color,
  });

  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppSizes.radiusM),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(AppSizes.paddingM),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: AppSizes.iconM, color: color),
            ),
            const SizedBox(height: AppSizes.spaceS),
            Text(
              label,
              style: Theme.of(
                context,
              ).textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
