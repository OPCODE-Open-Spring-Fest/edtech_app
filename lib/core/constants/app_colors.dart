import 'package:flutter/material.dart';

/// App color palette following Material Design 3
class AppColors {
  AppColors._();

  // Primary Colors
  static const Color primary = Color(0xFF2563EB); // Blue - Trust, Intelligence
  static const Color primaryLight = Color(0xFF60A5FA);
  static const Color primaryDark = Color(0xFF1E40AF);

  static const Color secondary = Color(0xFF10B981); // Green - Growth, Success
  static const Color secondaryLight = Color(0xFF34D399);
  static const Color secondaryDark = Color(0xFF059669);

  static const Color accent = Color(0xFFF59E0B); // Orange - Energy, Attention
  static const Color accentLight = Color(0xFFFBBF24);
  static const Color accentDark = Color(0xFFD97706);

  // Semantic Colors
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);

  // Neutral Colors
  static const Color background = Color(0xFFB6DCFB);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFF1F5F9);
  static const Color surfaceLight = Color(
    0xFFF8FAFC,
  ); // Very light grey for backgrounds

  // Text Colors
  static const Color textPrimary = Color(0xFF1F2937);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textDisabled = Color(0xFF9CA3AF);
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  // Border & Divider
  static const Color border = Color(0xFFE5E7EB);
  static const Color divider = Color(0xFFD1D5DB);

  // Grade Colors
  static const Color gradeA = Color(0xFF10B981); // Green
  static const Color gradeB = Color(0xFF3B82F6); // Blue
  static const Color gradeC = Color(0xFFF59E0B); // Orange
  static const Color gradeD = Color(0xFFF97316); // Dark Orange
  static const Color gradeF = Color(0xFFEF4444); // Red

  // Attendance Colors
  static const Color present = Color(0xFF10B981); // Green
  static const Color absent = Color(0xFFEF4444); // Red
  static const Color late = Color(0xFFF59E0B); // Orange
  static const Color holiday = Color(0xFF8B5CF6); // Purple

  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, primaryDark],
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [secondary, secondaryDark],
  );

  static const LinearGradient accentGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [accent, accentDark],
  );

  // Shadow Colors
  static Color shadow = Colors.black.withOpacity(0.08);
  static Color shadowDark = Colors.black.withOpacity(0.16);
}
