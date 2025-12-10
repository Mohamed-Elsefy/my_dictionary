import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_dictionary/controllers/read_data_cubit/read_data_cubit.dart';
import 'package:my_dictionary/controllers/read_data_cubit/read_data_state.dart';
import 'package:my_dictionary/core/constants/app_colors.dart';
import 'package:my_dictionary/core/constants/app_size.dart';
import 'package:my_dictionary/core/constants/app_spacing.dart';
import 'package:my_dictionary/core/utils/extentions.dart';
import 'package:my_dictionary/view/widgets/filter_dialog.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final readCubit = context.read<ReadDataCubit>();

    return BlocBuilder<ReadDataCubit, ReadDataState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            // title
            Text(
              readCubit.languageFilter.filterLabel,
              style: Theme.of(context).textTheme.titleLarge,
            ),

            // filter button
            ElevatedButton(
              onPressed: () => showDialog(
                context: context,
                builder: (context) => const FilterDialog(),
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(AppSpacing.p_8),
                shape: const CircleBorder(),
                backgroundColor: AppColors.white,
              ),
              child: const Icon(
                Icons.filter_list,
                color: AppColors.black,
                size: AppSize.s_25,
              ),
            ),
          ],
        );
      },
    );
  }
}
