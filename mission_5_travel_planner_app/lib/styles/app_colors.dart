import 'package:flutter/material.dart';

class AppColors {
  final Color background;
  final Color surface;
  final Color textPrimary;
  final Color textSecondary;
  final Color primary;
  final Color divider;
  final Color shadow;
  final Color onPrimary;
  final Color success;
  final Color border;
  final Color error;

  const AppColors({
    required this.background,
    required this.surface,
    required this.textPrimary,
    required this.textSecondary,
    required this.primary,
    required this.divider,
    required this.shadow,
    required this.onPrimary,
    required this.success,
    required this.border,
    required this.error,
  });

  static AppColors of(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark ? dark : light;
  }

  static const light = AppColors(
    background: Color(0xFFF9FAFB),
    surface: Color(0xFFFFFFFF),
    textPrimary: Color(0xFF1A1A1A),
    textSecondary: Color(0xFF6B7280),
    primary: Color(0xFF6B8AFE),
    divider: Color(0xFFE5E7EB),
    shadow: Color(0x1A000000),
    onPrimary: Colors.white,
    success: Color(0xFF16A34A),
    border: Color(0xFFE5E7EB),
    error: Color(0xFFDC2626),
  );

  static const dark = AppColors(
    background: Color(0xFF121417),
    surface: Color(0xFF1C1F24),
    textPrimary: Color(0xFFE6E6E6),
    textSecondary: Color(0xFF9CA3AF),
    primary: Color(0xFF8FA8FF),
    divider: Color(0xFF2A2E35),
    shadow: Color(0x33000000),
    onPrimary: Colors.black,
    success: Color(0xFF22C55E),
    border: Color(0xFF374151),
    error: Color(0xFFF87171),
  );
}
