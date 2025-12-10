import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_dictionary/controllers/write_data_cubit/write_data_cubit.dart';
import 'package:my_dictionary/core/constants/app_colors.dart';
import 'package:my_dictionary/core/constants/app_strings.dart';
import 'package:my_dictionary/core/constants/app_size.dart';
import 'package:my_dictionary/core/constants/app_spacing.dart';

class ArabicOrEnglishWidget extends StatelessWidget {
  const ArabicOrEnglishWidget({
    super.key,
    required this.colorCode,
    required this.isArabic,
  });

  final int colorCode;
  final bool isArabic;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _getContainerDesign(context, true),
        AppSpacing.h_8,
        _getContainerDesign(context, false),
      ],
    );
  }

  InkWell _getContainerDesign(BuildContext context, bool isArabic) {
    final writeCubit = context.watch<WriteDataCubit>();

    return InkWell(
      onTap: () => writeCubit.updateIsArabic(isArabic),
      child: Container(
        height: AppSize.s_50,
        width: AppSize.s_50,
        decoration: BoxDecoration(
          color: (isArabic == this.isArabic) ? AppColors.white : null,
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.white, width: 2),
        ),
        child: Center(
          child: Text(
            isArabic ? AppStrings.ar : AppStrings.en,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: (isArabic == this.isArabic) ? Color(colorCode) : null,
            ),
          ),
        ),
      ),
    );
  }
}
