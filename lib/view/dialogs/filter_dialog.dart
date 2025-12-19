import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_dictionary/controllers/read_data_cubit/read_data_cubit.dart';
import 'package:my_dictionary/controllers/read_data_cubit/read_data_state.dart';
import 'package:my_dictionary/core/constants/app_colors.dart';
import 'package:my_dictionary/core/constants/app_radius.dart';
import 'package:my_dictionary/core/constants/app_size.dart';
import 'package:my_dictionary/core/constants/app_spacing.dart';
import 'package:my_dictionary/core/constants/app_strings.dart';
import 'package:my_dictionary/core/utils/extentions.dart';

class FilterDialog extends StatelessWidget {
  const FilterDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: BlocBuilder<ReadDataCubit, ReadDataState>(
        builder: (context, state) {
          final readCubit = context.read<ReadDataCubit>();

          return Container(
            width: AppSize.s_330,
            padding: const EdgeInsets.all(AppSpacing.p_20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppRadius.r_10),
              color: AppColors.background,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // language filter
                  Text(
                    AppStrings.language,
                    style: context.textTheme.titleLarge,
                  ),
                  AppSpacing.v_8,
                  _FilterItems<LanguageFilter>(
                    values: LanguageFilter.values,
                    selected: readCubit.languageFilter,
                    onSelected: readCubit.setLanguageFilter,
                    labelBuilder: (e) => e.getLabel,
                  ),

                  AppSpacing.v_20,

                  // sorted type filter
                  Text(
                    AppStrings.sortingType,
                    style: context.textTheme.titleLarge,
                  ),
                  AppSpacing.v_8,
                  _FilterItems<SortType>(
                    values: SortType.values,
                    selected: readCubit.sortType,
                    onSelected: readCubit.setSortType,
                    labelBuilder: (e) => e.getLabel,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _FilterItems<T> extends StatelessWidget {
  const _FilterItems({
    required this.values,
    required this.selected,
    required this.onSelected,
    required this.labelBuilder,
  });

  final List<T> values;
  final T selected;
  final ValueChanged<T> onSelected;
  final String Function(T) labelBuilder;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s_40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: values.length,
        separatorBuilder: (_, _) => AppSpacing.h_8,
        itemBuilder: (context, index) {
          final item = values[index];
          final isSelected = item == selected;

          return InkWell(
            onTap: () => onSelected(item),
            borderRadius: BorderRadius.circular(AppRadius.r_10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.p_8),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : null,
                border: Border.all(color: AppColors.primary, width: 2),
                borderRadius: BorderRadius.circular(AppRadius.r_10),
              ),
              child: Text(
                labelBuilder(item),
                style: context.textTheme.bodyMedium!.copyWith(
                  color: isSelected ? AppColors.background : AppColors.primary,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
