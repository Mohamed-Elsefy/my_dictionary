import 'package:flutter/material.dart';
import 'package:my_dictionary/core/constants/app_colors.dart';
import 'package:my_dictionary/core/constants/app_radius.dart';
import 'package:my_dictionary/core/constants/app_size.dart';
import 'package:my_dictionary/core/constants/app_spacing.dart';
import 'package:my_dictionary/core/constants/app_strings.dart';
import 'package:my_dictionary/core/utils/extentions.dart';

class LanguagePickerWidget extends StatelessWidget {
  const LanguagePickerWidget({
    super.key,
    required this.isArabicSelected,
    required this.onLanguageChanged,
    required this.colorCode,
  });

  final bool isArabicSelected;
  final ValueChanged<bool> onLanguageChanged;
  final int colorCode;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _LanguageItem(
          label: AppStrings.en,
          isSelected: !isArabicSelected,
          onTap: () => onLanguageChanged(false),
          colorCode: colorCode,
        ),
        AppSpacing.h_8,
        _LanguageItem(
          label: AppStrings.ar,
          isSelected: isArabicSelected,
          onTap: () => onLanguageChanged(true),
          colorCode: colorCode,
        ),
      ],
    );
  }
}

class _LanguageItem extends StatelessWidget {
  const _LanguageItem({
    required this.label,
    required this.isSelected,
    required this.onTap,
    required this.colorCode,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final int colorCode;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.r_10),
      child: Container(
        height: AppSize.s_50,
        width: AppSize.s_50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.primary, width: 2),
        ),
        child: Text(
          label,
          style: context.textTheme.bodyMedium!.copyWith(
            color: isSelected ? Color(colorCode) : AppColors.primary,
          ),
        ),
      ),
    );
  }
}
