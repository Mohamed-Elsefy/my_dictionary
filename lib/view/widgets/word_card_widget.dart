import 'package:flutter/material.dart';
import 'package:my_dictionary/core/constants/app_colors.dart';
import 'package:my_dictionary/core/constants/app_radius.dart';
import 'package:my_dictionary/core/constants/app_size.dart';
import 'package:my_dictionary/core/constants/app_spacing.dart';
import 'package:my_dictionary/core/utils/extentions.dart';
import 'package:my_dictionary/view/widgets/word_language_badge_widget.dart';

class WordCardWidget extends StatelessWidget {
  const WordCardWidget({
    super.key,
    required this.text,
    required this.colorCode,
    required this.isArabic,
    this.iconData,
    this.onPressed,
  });

  final String text;
  final int colorCode;
  final bool isArabic;
  final IconData? iconData;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.p_8),
      padding: const EdgeInsets.all(AppSpacing.p_8),
      decoration: BoxDecoration(
        color: Color(colorCode),
        borderRadius: BorderRadius.circular(AppRadius.r_10),
      ),
      child: Row(
        children: [
          // ar/en
          WordLanguageBadgeWidget(isArabic: isArabic, colorCode: colorCode),

          AppSpacing.h_8,

          Expanded(
            child: Text(
              text,
              style: context.textTheme.bodyMedium!.copyWith(
                color: AppColors.background,
              ),
            ),
          ),

          if (iconData != null)
            IconButton(
              onPressed: onPressed,
              padding: EdgeInsets.zero,
              color: AppColors.background,
              iconSize: AppSize.s_22,
              visualDensity: VisualDensity.compact,
              icon: Icon(iconData!),
            ),
        ],
      ),
    );
  }
}
