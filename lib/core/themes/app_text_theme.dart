import 'package:flutter/material.dart';
import 'package:my_dictionary/core/constants/app_colors.dart';

abstract class AppTextTheme {
  static TextTheme get light => const TextTheme(
    titleLarge: TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w600,
      color: AppColors.primary,
    ),

    bodyLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: AppColors.primary,
    ),

    bodyMedium: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.normal,
      color: AppColors.primary,
    ),

    bodySmall: TextStyle(fontSize: 14, color: AppColors.primary),
  );
}
