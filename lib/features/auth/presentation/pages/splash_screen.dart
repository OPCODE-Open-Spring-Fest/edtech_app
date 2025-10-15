import 'package:flutter/material.dart';
import 'package:adhyan/core/constants/app_colors.dart';
import 'package:adhyan/core/constants/app_sizes.dart';
import 'package:adhyan/core/constants/app_strings.dart';
import 'package:adhyan/features/auth/presentation/pages/login_screen.dart';

/// Splash screen shown on app launch
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _navigateToLogin();
  }

  void _initializeAnimations() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.65, curve: Curves.easeIn),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.65, curve: Curves.elasticOut),
      ),
    );

    _animationController.forward();
  }

  Future<void> _navigateToLogin() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute<void>(builder: (context) => const LoginScreen()),
      );
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.primaryGradient),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Animated Logo
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return FadeTransition(
                    opacity: _fadeAnimation,
                    child: ScaleTransition(
                      scale: _scaleAnimation,
                      child: child,
                    ),
                  );
                },
                child: Container(
                  width: AppSizes.imageXL,
                  height: AppSizes.imageXL,
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(AppSizes.radiusXXL),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadowDark,
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.school,
                    size: AppSizes.iconXXL * 1.5,
                    color: AppColors.primary,
                  ),
                ),
              ),

              const SizedBox(height: AppSizes.spaceXXL),

              // App Name
              FadeTransition(
                opacity: _fadeAnimation,
                child: Text(
                  AppStrings.appName,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: AppColors.textOnPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: AppSizes.spaceS),

              // Tagline
              FadeTransition(
                opacity: _fadeAnimation,
                child: Text(
                  AppStrings.appTagline,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.textOnPrimary.withOpacity(0.9),
                  ),
                ),
              ),

              const SizedBox(height: AppSizes.spaceXXXL),

              // Loading Indicator
              FadeTransition(
                opacity: _fadeAnimation,
                child: const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.textOnPrimary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
