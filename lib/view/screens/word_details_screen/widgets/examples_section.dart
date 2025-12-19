import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_dictionary/controllers/write_data_cubit/write_data_cubit.dart';
import 'package:my_dictionary/core/constants/app_spacing.dart';
import 'package:my_dictionary/core/constants/app_strings.dart';
import 'package:my_dictionary/data/models/word_model.dart';
import 'package:my_dictionary/view/dialogs/confirm_delete_dialog.dart';
import 'package:my_dictionary/view/dialogs/add_example_similar_word_dialog.dart';
import 'package:my_dictionary/view/widgets/section_title_widget.dart';
import 'package:my_dictionary/view/widgets/update_button_widget.dart';
import 'package:my_dictionary/view/widgets/word_card_widget.dart';

class ExamplesSection extends StatelessWidget {
  const ExamplesSection({super.key, required this.wordKey, required this.word});

  final int wordKey;
  final WordModel word;

  @override
  Widget build(BuildContext context) {
    final writeCubit = context.read<WriteDataCubit>();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SectionTitleWidget(
              title: AppStrings.examples,
              colorCode: word.colorCode,
            ),

            UpdateButtonWidget(
              colorCode: word.colorCode,
              onPressed: () => showDialog(
                context: context,
                builder: (context) => AddExampleSimilarWordDialog(
                  wordKey: wordKey,
                  colorCode: word.colorCode,
                  isExample: true,
                ),
              ),
            ),
          ],
        ),

        AppSpacing.v_8,

        // build arabic examples
        ...List.generate(
          word.arabicExamples.length,
          (index) => WordCardWidget(
            text: word.arabicExamples[index],
            colorCode: word.colorCode,
            isArabic: true,
            iconData: Icons.delete,
            onPressed: () async {
              final confirmed = await confirmDeleteDialog(context);

              if (confirmed == true) {
                writeCubit.deleteExample(
                  key: wordKey,
                  index: index,
                  isArabic: true,
                );
              }
            },
          ),
        ),
        // build english examples
        ...List.generate(
          word.englishExamples.length,
          (index) => WordCardWidget(
            text: word.englishExamples[index],
            colorCode: word.colorCode,
            isArabic: false,
            iconData: Icons.delete,
            onPressed: () async {
              final confirmed = await confirmDeleteDialog(context);

              if (confirmed == true) {
                writeCubit.deleteExample(
                  key: wordKey,
                  index: index,
                  isArabic: false,
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
