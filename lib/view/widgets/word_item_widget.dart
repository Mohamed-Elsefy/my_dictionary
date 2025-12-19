import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_dictionary/controllers/read_data_cubit/read_data_cubit.dart';
import 'package:my_dictionary/controllers/write_data_cubit/write_data_cubit.dart';
import 'package:my_dictionary/core/constants/app_radius.dart';
import 'package:my_dictionary/core/constants/app_spacing.dart';
import 'package:my_dictionary/core/utils/extentions.dart';
import 'package:my_dictionary/core/utils/navigation.dart';
import 'package:my_dictionary/data/models/word_model.dart';
import 'package:my_dictionary/view/dialogs/confirm_delete_dialog.dart';
import 'package:my_dictionary/view/screens/word_details_screen/word_details_screen.dart';

class WordItemWidget extends StatelessWidget {
  const WordItemWidget({super.key, required this.wordKey, required this.word});

  final int wordKey;
  final WordModel word;

  @override
  Widget build(BuildContext context) {
    final writeCubit = context.read<WriteDataCubit>();
    final readCubit = context.read<ReadDataCubit>();

    return Dismissible(
      key: ValueKey(wordKey),
      direction: DismissDirection.horizontal,
      onDismissed: (_) {
        writeCubit.deleteWord(wordKey);
        readCubit.loadWords();
      },
      confirmDismiss: (_) async {
        return await confirmDeleteDialog(context);
      },

      child: GestureDetector(
        onTap: () async {
          final deleted = await Navigation.push<bool>(
            context,
            WordDetailsScreen(wordKey: wordKey),
          );

          if (deleted == true) {
            readCubit.loadWords();
          }
        },
        child: Container(
          clipBehavior: Clip.hardEdge,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(AppSpacing.p_14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.r_20),
            color: Color(word.colorCode),
          ),
          child: Text(word.text, style: context.textTheme.bodyLarge),
        ),
      ),
    );
  }
}
