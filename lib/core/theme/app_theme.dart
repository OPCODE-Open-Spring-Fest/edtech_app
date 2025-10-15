import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adhyan/core/constants/app_colors.dart';
import 'package:adhyan/core/constants/app_sizes.dart';

/// App theme configuration with Material Design 3
class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      
      // Color Scheme
      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        primaryContainer: AppColors.primaryLight,
        secondary: AppColors.secondary,
        secondaryContainer: AppColors.secondaryLight,
        tertiary: AppColors.accent,
        tertiaryContainer: AppColors.accentLight,
        error: AppColors.error,
        surface: AppColors.surface,
        onPrimary: AppColors.textOnPrimary,
        onSecondary: AppColors.textOnPrimary,
        onSurface: AppColors.textPrimary,
        onError: AppColors.textOnPrimary,
      ),

      // Scaffold Background
      scaffoldBackgroundColor: AppColors.background,

      // App Bar Theme
      appBarTheme: AppBarTheme(
        elevation: AppSizes.appBarElevation,
        centerTitle: false,
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.textPrimary,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        iconTheme: const IconThemeData(
          color: AppColors.textPrimary,
          size: AppSizes.iconM,
        ),
      ),

      // Text Theme
      textTheme: TextTheme(
        // Display
        displayLarge: GoogleFonts.poppins(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
        ),
        displayMedium: GoogleFonts.poppins(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        displaySmall: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        
        // Headline
        headlineLarge: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        headlineMedium: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        headlineSmall: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        
        // Title
        titleLarge: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimary,
        ),
        titleMedium: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimary,
        ),
        titleSmall: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimary,
        ),
        
        // Body
        bodyLarge: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.textPrimary,
        ),
        bodyMedium: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.textPrimary,
        ),
        bodySmall: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.textSecondary,
        ),
        
        // Label
        labelLarge: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimary,
        ),
        labelMedium: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: AppColors.textSecondary,
        ),
        labelSmall: GoogleFonts.poppins(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          color: AppColors.textSecondary,
        ),
      ),

      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.textOnPrimary,
          elevation: 0,
          minimumSize: const Size.fromHeight(AppSizes.buttonHeight),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
          ),
          textStyle: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // Text Button Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          textStyle: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      // Outlined Button Theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          minimumSize: const Size.fromHeight(AppSizes.buttonHeight),
          side: const BorderSide(color: AppColors.primary, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
          ),
          textStyle: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // Icon Button Theme
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: AppColors.textPrimary,
          iconSize: AppSizes.iconM,
        ),
      ),

      // Card Theme
      cardTheme: CardThemeData(
        elevation: AppSizes.cardElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.cardRadius),
        ),
        color: AppColors.surface,
        margin: const EdgeInsets.all(AppSizes.paddingS),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSizes.padding,
          vertical: AppSizes.paddingM,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.inputRadius),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.inputRadius),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.inputRadius),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.inputRadius),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.inputRadius),
          borderSide: const BorderSide(color: AppColors.error, width: 2),
        ),
        labelStyle: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.textSecondary,
        ),
        hintStyle: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.textDisabled,
        ),
        errorStyle: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.error,
        ),
      ),

      // Chip Theme
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.surfaceVariant,
        selectedColor: AppColors.primary,
        labelStyle: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusL),
        ),
      ),

      // Bottom Navigation Bar Theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.surface,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textSecondary,
        selectedLabelStyle: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),

      // Divider Theme
      dividerTheme: const DividerThemeData(
        color: AppColors.divider,
        thickness: AppSizes.dividerThickness,
        space: AppSizes.dividerThickness,
      ),

      // Progress Indicator Theme
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.primary,
      ),

      // Snackbar Theme
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.textPrimary,
        contentTextStyle: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.textOnPrimary,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusM),
        ),
        behavior: SnackBarBehavior.floating,
      ),

      // Dialog Theme
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusL),
        ),
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        contentTextStyle: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.textSecondary,
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    // For now, returning light theme. Can be implemented later if needed
    return lightTheme;
  }
}
