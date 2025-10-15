import 'package:flutter/material.dart';
import 'package:adhyan/core/constants/app_colors.dart';
import 'package:adhyan/core/constants/app_sizes.dart';
import 'package:adhyan/core/constants/app_strings.dart';
import 'package:adhyan/features/student/presentation/widgets/quick_stats_widget.dart';
import 'package:adhyan/features/student/presentation/widgets/action_grid_widget.dart';
import 'package:adhyan/features/student/presentation/widgets/today_schedule_widget.dart';

/// Student Dashboard - Main home screen for students
class StudentDashboard extends StatefulWidget {
  const StudentDashboard({super.key});

  @override
  State<StudentDashboard> createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  int _selectedIndex = 0;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.surfaceLight,
      body: _buildBody(),
      bottomNavigationBar: _buildModernBottomNav(),
    );
  }

  Widget _buildModernBottomNav() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textSecondary,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_rounded),
            label: AppStrings.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined),
            activeIcon: Icon(Icons.menu_book_rounded),
            label: AppStrings.learn,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videogame_asset_outlined),
            activeIcon: Icon(Icons.videogame_asset_rounded),
            label: AppStrings.games,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            activeIcon: Icon(Icons.person_rounded),
            label: AppStrings.profile,
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return _buildHomeTab();
      case 1:
        return _buildLearnTab();
      case 2:
        return _buildGamesTab();
      case 3:
        return _buildProfileTab();
      default:
        return _buildHomeTab();
    }
  }

  Widget _buildHomeTab() {
    return RefreshIndicator(
      onRefresh: () async {
        // TODO: Implement pull-to-refresh
        await Future.delayed(const Duration(seconds: 1));
      },
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          // Modern App Bar with Profile Header
          SliverAppBar(
            expandedHeight: 160,
            pinned: true,
            backgroundColor: AppColors.primary,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: AppColors.primaryGradient,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hello, Rahul!',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.copyWith(
                                        color: AppColors.textOnPrimary,
                                        fontWeight: FontWeight.w700,
                                      ),
                                ),
                                const SizedBox(height: AppSizes.spaceXS),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: AppSizes.paddingM,
                                    vertical: AppSizes.paddingXS,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(
                                      AppSizes.radiusM,
                                    ),
                                  ),
                                  child: Text(
                                    'Class 10-A',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: AppColors.textOnPrimary,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            // Profile Avatar with Notification Badge
                            Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                  child: const CircleAvatar(
                                    radius: 24,
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      Icons.person_rounded,
                                      color: AppColors.primary,
                                      size: AppSizes.iconM,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  top: 0,
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: const BoxDecoration(
                                      color: AppColors.error,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Text(
                                      '3',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Content
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppSizes.spaceL),

                // Quick Stats
                const QuickStatsWidget(),

                const SizedBox(height: AppSizes.spaceXL),

                // Quick Actions Section
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.padding,
                  ),
                  child: Text(
                    AppStrings.quickActions,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
                const SizedBox(height: AppSizes.space),
                const ActionGridWidget(),

                const SizedBox(height: AppSizes.spaceXL),

                // Today's Schedule
                const TodayScheduleWidget(),

                const SizedBox(height: AppSizes.spaceL),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLearnTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.menu_book_outlined,
            size: AppSizes.iconXXL,
            color: AppColors.textSecondary,
          ),
          const SizedBox(height: AppSizes.space),
          Text(
            'Learning Hub',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: AppSizes.spaceS),
          Text(
            'Coming soon...',
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }

  Widget _buildGamesTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.games_outlined,
            size: AppSizes.iconXXL,
            color: AppColors.textSecondary,
          ),
          const SizedBox(height: AppSizes.space),
          Text(
            'Educational Games',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: AppSizes.spaceS),
          Text(
            'Coming soon...',
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: AppSizes.avatarXL / 2,
            backgroundColor: AppColors.primary,
            child: Icon(
              Icons.person,
              size: AppSizes.iconXL,
              color: AppColors.textOnPrimary,
            ),
          ),
          const SizedBox(height: AppSizes.space),
          Text(
            'Rahul Kumar',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: AppSizes.spaceS),
          Text(
            'Class 10-A • Roll No: 15',
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary),
          ),
          const SizedBox(height: AppSizes.spaceXL),
          Text(
            'Profile settings coming soon...',
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}
