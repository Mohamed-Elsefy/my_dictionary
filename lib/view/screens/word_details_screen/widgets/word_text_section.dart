import 'package:flutter/material.dart';
import 'package:my_dictionary/core/constants/app_spacing.dart';
import 'package:my_dictionary/core/constants/app_strings.dart';
import 'package:my_dictionary/data/models/word_model.dart';
import 'package:my_dictionary/view/dialogs/update_word_dialog.dart';
import 'package:my_dictionary/view/widgets/section_title_widget.dart';
import 'package:my_dictionary/view/widgets/word_card_widget.dart';

class WordTextSection extends StatelessWidget {
  const WordTextSection({super.key, required this.wordKey, required this.word});

  final int wordKey;
  final WordModel word;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitleWidget(title: AppStrings.word, colorCode: word.colorCode),
        AppSpacing.v_8,
        WordCardWidget(
          text: word.text,
          colorCode: word.colorCode,
          isArabic: word.isArabic,
          iconData: Icons.edit,
          onPressed: () => showDialog(
            context: context,
            builder: (context) =>
                UpdateWordDialog(wordKey: wordKey, word: word),
          ),
        ),
      ],
    );
  }
}
