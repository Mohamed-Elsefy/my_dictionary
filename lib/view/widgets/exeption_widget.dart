import 'package:flutter/material.dart';
import 'package:my_dictionary/core/constants/app_colors.dart';
import 'package:my_dictionary/core/constants/app_size.dart';
import 'package:my_dictionary/core/constants/app_spacing.dart';

class ExeptionWidget extends StatelessWidget {
  const ExeptionWidget({
    super.key,
    required this.iconData,
    required this.message,
  });

  final IconData iconData;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(iconData, color: AppColors.white, size: AppSize.s_50),
        AppSpacing.v_8,
        Text(message, 
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleLarge),
      ],
    );
  }
}
