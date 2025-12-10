import 'package:flutter/material.dart';
import 'package:my_dictionary/core/constants/app_colors.dart';
import 'package:my_dictionary/core/constants/app_radius.dart';
import 'package:my_dictionary/core/constants/app_strings.dart';

class DoneButtonWidget extends StatelessWidget {
  const DoneButtonWidget({
    super.key,
    required this.colorCode,
    required this.onPressed,
  });

  final int colorCode;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.centerRight,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.r_10),
          ),
        ),
        child: Text(
          AppStrings.done,
          style: Theme.of(
            context,
          ).textTheme.bodySmall!.copyWith(color: Color(colorCode)),
        ),
      ),
    );
  }
}
