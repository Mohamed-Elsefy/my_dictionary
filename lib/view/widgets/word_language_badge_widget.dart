import 'package:flutter/material.dart';
import 'package:my_dictionary/core/constants/app_colors.dart';
import 'package:my_dictionary/core/constants/app_size.dart';
import 'package:my_dictionary/core/constants/app_spacing.dart';
import 'package:my_dictionary/core/constants/app_strings.dart';
import 'package:my_dictionary/core/utils/extentions.dart';

class WordLanguageBadgeWidget extends StatelessWidget {
  const WordLanguageBadgeWidget({
    super.key,
    required this.isArabic,
    required this.colorCode,
  });

  final bool isArabic;
  final int colorCode;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.s_50,
      padding: const EdgeInsets.all(AppSpacing.p_14),
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.background,
      ),
      child: Text(
        isArabic ? AppStrings.ar : AppStrings.en,
        style: context.textTheme.bodySmall!.copyWith(color: Color(colorCode)),
      ),
    );
  }
}
