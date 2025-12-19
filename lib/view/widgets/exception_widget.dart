import 'package:flutter/material.dart';
import 'package:my_dictionary/core/constants/app_colors.dart';
import 'package:my_dictionary/core/constants/app_size.dart';
import 'package:my_dictionary/core/constants/app_spacing.dart';
import 'package:my_dictionary/core/utils/extentions.dart';

class ExceptionWidget extends StatelessWidget {
  const ExceptionWidget({
    super.key,
    required this.iconData,
    required this.text,
  });

  final IconData iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(iconData, size: AppSize.s_100, color: AppColors.primary),
        AppSpacing.v_8,
        Text(
          text,
          style: context.textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        AppSpacing.v_40,
      ],
    );
  }
}
