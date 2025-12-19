import 'package:flutter/material.dart';
import 'package:my_dictionary/core/constants/app_colors.dart';
import 'package:my_dictionary/core/constants/app_radius.dart';
import 'package:my_dictionary/core/constants/app_size.dart';

class UpdateButtonWidget extends StatelessWidget {
  const UpdateButtonWidget({
    super.key,
    required this.colorCode,
    required this.onPressed,
  });

  final int colorCode;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(colorCode),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.r_10),
        ),
        iconColor: AppColors.background,
        iconSize: AppSize.s_22,
      ),
      child: const Icon(Icons.add),
    );
  }
}
