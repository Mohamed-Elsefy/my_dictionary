import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_dictionary/controllers/read_data_cubit/read_data_cubit.dart';
import 'package:my_dictionary/controllers/read_data_cubit/read_data_state.dart';
import 'package:my_dictionary/core/constants/app_size.dart';
import 'package:my_dictionary/core/constants/app_spacing.dart';
import 'package:my_dictionary/core/constants/app_strings.dart';
import 'package:my_dictionary/view/widgets/word_item_widget.dart';
import 'package:my_dictionary/view/widgets/exception_widget.dart';
import 'package:my_dictionary/view/widgets/loading_widget.dart';

class WordsGrid extends StatelessWidget {
  const WordsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ReadDataCubit, ReadDataState>(
        builder: (context, state) {
          if (state is ReadDataFailure) {
            return ExceptionWidget(iconData: Icons.error, text: state.message);
          }

          if (state is ReadDataSuccess) {
            final words = state.words;

            if (words.isEmpty) {
              return const ExceptionWidget(
                iconData: Icons.list_alt_rounded,
                text: AppStrings.dictionaryIsEmpty,
              );
            }

            return GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: AppSize.s_170,
                mainAxisSpacing: AppSpacing.p_8,
                crossAxisSpacing: AppSpacing.p_8,
                childAspectRatio: 2 / 1.2,
              ),
              itemCount: words.length,
              itemBuilder: (context, index) {
                final entry = words[index];
                final wordKey = entry.key;
                final word = entry.value;

                return WordItemWidget(wordKey: wordKey, word: word);
              },
            );
          }

          return const LoadingWidget();
        },
      ),
    );
  }
}
