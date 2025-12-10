import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_dictionary/controllers/write_data_cubit/write_data_cubit.dart';
import 'package:my_dictionary/core/constants/app_colors.dart';
import 'package:my_dictionary/core/constants/app_size.dart';
import 'package:my_dictionary/core/constants/app_spacing.dart';

class ColorsWidget extends StatelessWidget {
  const ColorsWidget({super.key, required this.activeColorCode});

  final int activeColorCode;
  final List<int> _colorCodes = const [
    0XFF4A47A3,
    0XFF0C7893,
    0XFF892CDC,
    0XFFBC6FF1,
    0XFFF4ABC4,
    0XFFC70039,
    0XFF8FBC8F,
    0XFFFA8072,
    0XFF4D4C70,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s_40,
      child: ListView.separated(
        itemBuilder: (context, index) => _getItemDesign(index, context),
        separatorBuilder: (context, index) => AppSpacing.h_8,
        itemCount: _colorCodes.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
      ),
    );
  }

  Widget _getItemDesign(int index, BuildContext context) {
    final writeCubit = context.watch<WriteDataCubit>();

    return InkWell(
      onTap: () => writeCubit.updateColorCode(_colorCodes[index]),
      child: Container(
        height: AppSize.s_40,
        width: AppSize.s_40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: activeColorCode == _colorCodes[index]
              ? Border.all(color: AppColors.white, width: 2)
              : null,
          color: Color(_colorCodes[index]),
        ),
        child: activeColorCode == _colorCodes[index]
            ? const Center(child: Icon(Icons.done, color: AppColors.white))
            : null,
      ),
    );
  }
}
