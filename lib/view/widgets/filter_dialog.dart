import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_dictionary/controllers/read_data_cubit/read_data_cubit.dart';
import 'package:my_dictionary/controllers/read_data_cubit/read_data_state.dart';
import 'package:my_dictionary/core/constants/app_colors.dart';
import 'package:my_dictionary/core/constants/app_radius.dart';
import 'package:my_dictionary/core/constants/app_size.dart';
import 'package:my_dictionary/core/constants/app_spacing.dart';
import 'package:my_dictionary/core/constants/app_strings.dart';

class FilterDialog extends StatelessWidget {
  const FilterDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final readCubit = context.read<ReadDataCubit>();

    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: BlocConsumer<ReadDataCubit, ReadDataState>(
        listener: (context, state) {
          if (state is ReadDataSuccess) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Container(
            width: AppSize.s_330,
            padding: const EdgeInsets.all(AppSpacing.p_20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppRadius.r_10),
              color: AppColors.black,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _languageFilter(context, readCubit),
                AppSpacing.v_16,

                _sortedByFilter(context, readCubit),
                AppSpacing.v_16,

                _sortingType(context, readCubit),
                AppSpacing.v_16,
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _sortingType(BuildContext context, ReadDataCubit readCubit) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _filterLable(context, AppStrings.sortingType),
        AppSpacing.v_8,
        _filterItems(
          context: context,
          lables: [AppStrings.ascending, AppStrings.descending],
          onTaps: [
            () => readCubit.updateSortingType(SortingType.ascending),
            () => readCubit.updateSortingType(SortingType.descending),
          ],
          activations: [
            readCubit.sortingType == SortingType.ascending,
            readCubit.sortingType == SortingType.descending,
          ],
        ),
      ],
    );
  }

  Widget _sortedByFilter(BuildContext context, ReadDataCubit readCubit) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _filterLable(context, AppStrings.sortedBy),
        AppSpacing.v_8,
        _filterItems(
          context: context,
          lables: [AppStrings.time, AppStrings.wordLength],
          onTaps: [
            () => readCubit.updateSortedBy(SortedBy.time),
            () => readCubit.updateSortedBy(SortedBy.wordLength),
          ],
          activations: [
            readCubit.sortedBy == SortedBy.time,
            readCubit.sortedBy == SortedBy.wordLength,
          ],
        ),
      ],
    );
  }

  Widget _languageFilter(BuildContext context, ReadDataCubit readCubit) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _filterLable(context, AppStrings.language),
        AppSpacing.v_8,
        _filterItems(
          context: context,
          lables: [AppStrings.all, AppStrings.arabic, AppStrings.english],
          onTaps: [
            () => readCubit.updateLanguageFilter(LanguageFilter.allWords),
            () => readCubit.updateLanguageFilter(LanguageFilter.arabicOnly),
            () => readCubit.updateLanguageFilter(LanguageFilter.englishOnly),
          ],
          activations: [
            readCubit.languageFilter == LanguageFilter.allWords,
            readCubit.languageFilter == LanguageFilter.arabicOnly,
            readCubit.languageFilter == LanguageFilter.englishOnly,
          ],
        ),
      ],
    );
  }

  Widget _filterItems({
    required BuildContext context,
    required List<String> lables,
    required List<VoidCallback> onTaps,
    required List<bool> activations,
  }) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i < lables.length; i++)
            InkWell(
              onTap: onTaps[i],
              child: Container(
                margin: const EdgeInsets.only(right: AppSpacing.p_8),
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.p_14,
                  vertical: AppSpacing.p_8,
                ),
                decoration: BoxDecoration(
                  color: activations[i] ? AppColors.white : null,
                  borderRadius: BorderRadius.circular(AppRadius.r_10),
                  border: Border.all(color: AppColors.white, width: 1),
                ),
                child: Text(
                  lables[i],
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: activations[i] ? AppColors.black : null,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Text _filterLable(BuildContext context, String lable) =>
      Text(lable, style: Theme.of(context).textTheme.titleMedium);
}
