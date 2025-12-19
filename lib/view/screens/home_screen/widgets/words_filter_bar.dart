import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_dictionary/controllers/read_data_cubit/read_data_cubit.dart';
import 'package:my_dictionary/controllers/read_data_cubit/read_data_state.dart';
import 'package:my_dictionary/core/constants/app_colors.dart';
import 'package:my_dictionary/core/constants/app_size.dart';
import 'package:my_dictionary/core/constants/app_spacing.dart';
import 'package:my_dictionary/core/utils/extentions.dart';
import 'package:my_dictionary/view/dialogs/filter_dialog.dart';
import 'package:my_dictionary/view/widgets/animated_search_field_widget.dart';

class WordsFilterBar extends StatelessWidget {
  const WordsFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<ReadDataCubit, ReadDataState>(
          builder: (context, state) {
            final readCubit = context.read<ReadDataCubit>();

            return Text(
              readCubit.languageFilter.getLabel,
              style: context.textTheme.titleLarge,
            );
          },
        ),
        const Expanded(child: AnimatedSearchField()),

        ElevatedButton(
          onPressed: () => showDialog(
            context: context,
            builder: (context) => const FilterDialog(),
          ),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(AppSpacing.p_8),
            shape: const CircleBorder(),
            backgroundColor: AppColors.primary,
            iconColor: AppColors.background,
            iconSize: AppSize.s_22,
          ),
          child: const Icon(Icons.filter_list),
        ),
      ],
    );
  }
}
