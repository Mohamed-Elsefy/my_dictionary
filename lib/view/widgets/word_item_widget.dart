import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_dictionary/controllers/read_data_cubit/read_data_cubit.dart';
import 'package:my_dictionary/core/constants/app_radius.dart';
import 'package:my_dictionary/core/constants/app_spacing.dart';
import 'package:my_dictionary/model/word_model.dart';
import 'package:my_dictionary/view/screens/word_details_screen.dart';

class WordItemWidget extends StatelessWidget {
  const WordItemWidget({super.key, required this.wordModel});

  final MapEntry<int, WordModel> wordModel;

  @override
  Widget build(BuildContext context) {
    final WordModel word = wordModel.value;

    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WordDetailsScreen(wordModel: wordModel),
        ),
      // ignore: use_build_context_synchronously
      ).then((_) => context.read<ReadDataCubit>().getWords()),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(AppSpacing.p_14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.r_20),
          color: Color(word.colorCode),
        ),
        child: Text(word.text, style: Theme.of(context).textTheme.titleLarge),
      ),
    );
  }
}
