import 'package:flutter/material.dart';
import 'package:my_dictionary/core/constants/app_colors.dart';
import 'package:my_dictionary/core/constants/app_radius.dart';
import 'package:my_dictionary/core/constants/app_strings.dart';
import 'package:my_dictionary/core/utils/extentions.dart';

class DoneButtonWidget extends StatelessWidget {
  const DoneButtonWidget({
    super.key,
    required this.onPressed,
    required this.colorCode,
  });

  final VoidCallback onPressed;
  final int colorCode;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Color(colorCode),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.r_10),
          ),
          textStyle: context.textTheme.bodySmall,
        ),
        child: const Text(AppStrings.done),
      ),
    );
  }
}
