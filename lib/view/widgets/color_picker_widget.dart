import 'package:flutter/material.dart';
import 'package:my_dictionary/core/constants/app_colors.dart';
import 'package:my_dictionary/core/constants/app_size.dart';
import 'package:my_dictionary/core/constants/app_spacing.dart';

class ColorPickerWidget extends StatelessWidget {
  const ColorPickerWidget({
    super.key,
    required this.selectedColorCode,
    required this.onColorSelected,
  });

  final int selectedColorCode;
  final ValueChanged<int> onColorSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s_40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final colorCode = AppColors.wordColors[index];
          final isSelected = colorCode == selectedColorCode;

          return InkWell(
            onTap: () => onColorSelected(colorCode),
            child: Container(
              height: AppSize.s_40,
              width: AppSize.s_40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(colorCode),
                border: Border.all(
                  color: isSelected ? AppColors.primary : Color(colorCode),
                  width: 2,
                ),
              ),
              child: isSelected
                  ? const Icon(Icons.done, color: AppColors.primary)
                  : null,
            ),
          );
        },

        separatorBuilder: (context, index) => AppSpacing.h_8,
        itemCount: AppColors.wordColors.length,
      ),
    );
  }
}
