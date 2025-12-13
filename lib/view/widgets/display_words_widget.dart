import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_dictionary/controllers/read_data_cubit/read_data_cubit.dart';
import 'package:my_dictionary/controllers/read_data_cubit/read_data_state.dart';
import 'package:my_dictionary/core/constants/app_size.dart';
import 'package:my_dictionary/core/constants/app_spacing.dart';
import 'package:my_dictionary/core/constants/app_strings.dart';
import 'package:my_dictionary/model/word_model.dart';
import 'package:my_dictionary/view/widgets/exeption_widget.dart';
import 'package:my_dictionary/view/widgets/loading_widget.dart';
import 'package:my_dictionary/view/widgets/word_item_widget.dart';

class DisplayWordsWidget extends StatelessWidget {
  const DisplayWordsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadDataCubit, ReadDataState>(
      builder: (context, state) {
        if (state is ReadDataSuccess) {
          if (state.words.isEmpty) {
            return _getEmptyWords();
          }
          return _getWords(state.words);
        } else if (state is ReadDataFailure) {
          return _getFailure(state.message);
        }
        return _getLoading();
      },
    );
  }

  Widget _getWords(List words) => GridView.builder(
    physics: const BouncingScrollPhysics(),
    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: AppSize.s_160,
      mainAxisSpacing: AppSpacing.p_8,
      crossAxisSpacing: AppSpacing.p_8,
      childAspectRatio: 2 / 1.5,
    ),
    itemCount: words.length,
    itemBuilder: (BuildContext context, int index) {
      final MapEntry<int, WordModel> word = words[index];
      return WordItemWidget(wordModel: word);
    },
  );

  Widget _getEmptyWords() => const ExeptionWidget(
    iconData: Icons.list_sharp,
    message: AppStrings.noWords,
  );

  Widget _getLoading() => const LoadingWidget();

  Widget _getFailure(String message) =>
      ExeptionWidget(iconData: Icons.error, message: message);
}
