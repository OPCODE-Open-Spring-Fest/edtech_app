import 'package:flutter/material.dart';
import 'package:adhyan/core/constants/app_colors.dart';
import 'package:adhyan/core/constants/app_sizes.dart';
import 'package:adhyan/core/constants/app_strings.dart';
import 'package:adhyan/core/widgets/custom_text_field.dart';
import 'package:adhyan/features/student/presentation/pages/student_dashboard.dart';
import 'package:adhyan/features/parent/presentation/pages/parent_dashboard.dart';

/// Login screen with role selection (Student/Parent)
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _studentIdController = TextEditingController();
  final _passwordController = TextEditingController();
  final _schoolCodeController = TextEditingController();

  bool _rememberMe = false;
  bool _isLoading = false;
  int _selectedRoleIndex = 0; // 0 for Student, 1 for Parent

  @override
  void dispose() {
    _studentIdController.dispose();
    _passwordController.dispose();
    _schoolCodeController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    setState(() {
      _isLoading = false;
    });

    // Navigate based on role
    if (_selectedRoleIndex == 0) {
      // Student Dashboard
      Navigator.of(context).pushReplacement(
        MaterialPageRoute<void>(builder: (context) => const StudentDashboard()),
      );
    } else {
      // Parent Dashboard
      Navigator.of(context).pushReplacement(
        MaterialPageRoute<void>(builder: (context) => const ParentDashboard()),
      );
    }
  }

  Future<void> _handleBiometricLogin() async {
    // TODO: Implement biometric authentication
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Biometric authentication coming soon')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceLight,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.paddingXL,
              vertical: AppSizes.paddingL,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: AppSizes.spaceL),

                  // Welcome Text
                  Text(
                    'Welcome Back!',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: AppSizes.spaceS),

                  Text(
                    'Sign in to continue',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: AppSizes.spaceXXL),

                  // Role Selection - Modern Segmented Buttons
                  Container(
                    padding: const EdgeInsets.all(AppSizes.paddingXS),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(AppSizes.radiusL),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.shadow.withOpacity(0.08),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: _ModernRoleTab(
                            label: AppStrings.student,
                            icon: Icons.school_rounded,
                            isSelected: _selectedRoleIndex == 0,
                            onTap: () {
                              setState(() {
                                _selectedRoleIndex = 0;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: AppSizes.spaceS),
                        Expanded(
                          child: _ModernRoleTab(
                            label: AppStrings.parent,
                            icon: Icons.family_restroom_rounded,
                            isSelected: _selectedRoleIndex == 1,
                            onTap: () {
                              setState(() {
                                _selectedRoleIndex = 1;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: AppSizes.spaceXXL),

                  // Input Fields Card
                  Container(
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
                      children: [
                        // Student ID / Username
                        CustomTextField(
                          controller: _studentIdController,
                          label: _selectedRoleIndex == 0
                              ? AppStrings.studentId
                              : 'Parent ID',
                          hint: _selectedRoleIndex == 0
                              ? 'Enter student ID'
                              : 'Enter parent ID',
                          prefixIcon: Icons.badge_outlined,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppStrings.fieldRequired;
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: AppSizes.space),

                        // Password
                        PasswordTextField(
                          controller: _passwordController,
                          label: AppStrings.password,
                          hint: 'Enter password',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppStrings.fieldRequired;
                            }
                            if (value.length < 6) {
                              return AppStrings.invalidPassword;
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: AppSizes.space),

                        // School Code
                        CustomTextField(
                          controller: _schoolCodeController,
                          label: AppStrings.schoolCode,
                          hint: 'Enter school code',
                          prefixIcon: Icons.apartment_rounded,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppStrings.fieldRequired;
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: AppSizes.space),

                  // Remember Me & Forgot Password
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.paddingS,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 20,
                              width: 20,
                              child: Checkbox(
                                value: _rememberMe,
                                onChanged: (value) {
                                  setState(() {
                                    _rememberMe = value ?? false;
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    AppSizes.radiusS,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: AppSizes.spaceS),
                            Text(
                              AppStrings.rememberMe,
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(color: AppColors.textSecondary),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            // TODO: Implement forgot password
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: AppColors.primary,
                            padding: EdgeInsets.zero,
                          ),
                          child: Text(
                            AppStrings.forgotPassword,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: AppSizes.spaceXXL),

                  // Login Button - Prominent with shadow
                  Container(
                    height: AppSizes.buttonHeightL,
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      borderRadius: BorderRadius.circular(AppSizes.radiusL),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.4),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _handleLogin,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSizes.radiusL),
                        ),
                      ),
                      child: _isLoading
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.5,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  AppColors.textOnPrimary,
                                ),
                              ),
                            )
                          : Text(
                              AppStrings.login,
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(
                                    color: AppColors.textOnPrimary,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                    ),
                  ),

                  const SizedBox(height: AppSizes.space),

                  // Biometric Login - Outlined with icon
                  Container(
                    height: AppSizes.buttonHeightL,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.border, width: 1.5),
                      borderRadius: BorderRadius.circular(AppSizes.radiusL),
                    ),
                    child: ElevatedButton.icon(
                      onPressed: _handleBiometricLogin,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: AppColors.primary,
                        elevation: 0,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSizes.radiusL),
                        ),
                      ),
                      icon: const Icon(
                        Icons.fingerprint_rounded,
                        size: AppSizes.iconL,
                      ),
                      label: Text(
                        AppStrings.loginWithBiometric,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  ),

                  const SizedBox(height: AppSizes.spaceL),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Modern role selection tab with rounded design
class _ModernRoleTab extends StatelessWidget {
  const _ModernRoleTab({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(vertical: AppSizes.paddingM),
        decoration: BoxDecoration(
          gradient: isSelected ? AppColors.primaryGradient : null,
          color: isSelected ? null : Colors.transparent,
          borderRadius: BorderRadius.circular(AppSizes.radiusM),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: AppSizes.iconL,
              color: isSelected
                  ? AppColors.textOnPrimary
                  : AppColors.textSecondary,
            ),
            const SizedBox(height: AppSizes.spaceXS),
            Text(
              label,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: isSelected
                    ? AppColors.textOnPrimary
                    : AppColors.textSecondary,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
