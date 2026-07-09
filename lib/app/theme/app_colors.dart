import 'package:flutter/material.dart';

/// AKS Share Color System
///
/// Do not use raw Color() values anywhere in the app.
/// Always use AppColors.

class AppColors {
  AppColors._();

  //==============================
  // Brand Colors
  //==============================

  static const primary = Color(0xFF3B82F6);

  static const secondary = Color(0xFF22C55E);

  static const accent = Color(0xFF8B5CF6);

  //==============================
  // Background
  //==============================

  static const background = Color(0xFF0B1120);

  static const surface = Color(0xFF111827);

  static const card = Color(0xFF1A2235);

  //==============================
  // Text
  //==============================

  static const textPrimary = Colors.white;

  static const textSecondary = Color(0xFF9CA3AF);

  static const textHint = Color(0xFF6B7280);

  //==============================
  // Status
  //==============================

  static const success = Color(0xFF10B981);

  static const warning = Color(0xFFF59E0B);

  static const error = Color(0xFFEF4444);

  //==============================
  // Others
  //==============================

  static const divider = Color(0xFF293548);

  static const border = Color(0xFF374151);
}