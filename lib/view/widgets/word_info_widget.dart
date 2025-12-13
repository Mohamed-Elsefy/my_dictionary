import 'package:flutter/material.dart';
import 'package:my_dictionary/core/constants/app_colors.dart';
import 'package:my_dictionary/core/constants/app_radius.dart';
import 'package:my_dictionary/core/constants/app_size.dart';
import 'package:my_dictionary/core/constants/app_spacing.dart';
import 'package:my_dictionary/core/constants/app_strings.dart';

class WordInfoWidget extends StatelessWidget {
  const WordInfoWidget({
    super.key,
    required this.colorCode,
    required this.text,
    required this.isArabic,
    this.onPressed,
  });

  final int colorCode;
  final String text;
  final bool isArabic;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.p_8),
      padding: const EdgeInsets.all(AppSpacing.p_8),
      decoration: BoxDecoration(
        color: Color(colorCode),
        borderRadius: BorderRadius.circular(AppRadius.r_20),
      ),
      child: Row(
        children: [
          _isArabicOrEnglishIcon(),
          AppSpacing.h_16,

          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: AppColors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (onPressed != null)
            IconButton(
              onPressed: onPressed,
              icon: const Icon(
                Icons.delete,
                color: AppColors.black,
                size: AppSize.s_33,
              ),
            ),
        ],
      ),
    );
  }

  Container _isArabicOrEnglishIcon() {
    return Container(
      width: AppSize.s_50,
      padding: const EdgeInsets.all(AppSpacing.p_14),
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.black,
      ),
      child: Text(
        isArabic ? AppStrings.ar : AppStrings.en,
        style: TextStyle(color: Color(colorCode)),
      ),
    );
  }
}
