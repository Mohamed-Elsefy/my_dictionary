import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_dictionary/controllers/read_data_cubit/read_data_cubit.dart';
import 'package:my_dictionary/controllers/read_data_cubit/read_data_state.dart';
import 'package:my_dictionary/controllers/write_data_cubit/write_data_cubit.dart';
import 'package:my_dictionary/controllers/write_data_cubit/write_data_state.dart';
import 'package:my_dictionary/core/constants/app_spacing.dart';
import 'package:my_dictionary/core/utils/safe_padding.dart';
import 'package:my_dictionary/view/screens/word_details_screen/widgets/examples_section.dart';
import 'package:my_dictionary/view/screens/word_details_screen/widgets/similar_words_section.dart';
import 'package:my_dictionary/view/screens/word_details_screen/widgets/word_details_app_bar.dart';
import 'package:my_dictionary/view/screens/word_details_screen/widgets/word_text_section.dart';
import 'package:my_dictionary/view/widgets/exception_widget.dart';
import 'package:my_dictionary/view/widgets/loading_widget.dart';

class WordDetailsScreen extends StatelessWidget {
  const WordDetailsScreen({super.key, required this.wordKey});

  final int wordKey;

  @override
  Widget build(BuildContext context) {
    return BlocListener<WriteDataCubit, WriteDataState>(
      listener: (context, state) {
        if (state is WriteDataSuccess) {
          context.read<ReadDataCubit>().loadWords();
        }
      },
      child: BlocBuilder<ReadDataCubit, ReadDataState>(
        builder: (context, state) {
          if (state is ReadDataSuccess) {
            final entry = state.words.where((e) => e.key == wordKey).toList();

            if (entry.isEmpty) {
              return const LoadingWidget();
            }

            final word = entry.first.value;

            return Scaffold(
              appBar: WordDetailsAppBar(
                wordKey: wordKey,
                colorCode: word.colorCode,
              ),

              body: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SafePadding.horizP(context, factor: .06),
                ),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    WordTextSection(wordKey: wordKey, word: word),

                    AppSpacing.v_20,

                    SimilarWordsSection(wordKey: wordKey, word: word),

                    AppSpacing.v_20,

                    ExamplesSection(wordKey: wordKey, word: word),
                  ],
                ),
              ),
            );
          }

          if (state is ReadDataFailure) {
            return ExceptionWidget(iconData: Icons.error, text: state.message);
          }

          return const LoadingWidget();
        },
      ),
    );
  }
}
