import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_dictionary/controllers/read_data_cubit/read_data_cubit.dart';
import 'package:my_dictionary/controllers/read_data_cubit/read_data_state.dart';
import 'package:my_dictionary/controllers/write_data_cubit/write_data_cubit.dart';
import 'package:my_dictionary/core/constants/app_spacing.dart';
import 'package:my_dictionary/core/constants/app_strings.dart';
import 'package:my_dictionary/core/utils/safe_padding.dart';
import 'package:my_dictionary/model/word_model.dart';
import 'package:my_dictionary/view/widgets/exeption_widget.dart';
import 'package:my_dictionary/view/widgets/loading_widget.dart';
import 'package:my_dictionary/view/widgets/update_word_button_widget.dart';
import 'package:my_dictionary/view/widgets/update_word_dialog.dart';
import 'package:my_dictionary/view/widgets/word_info_widget.dart';

class WordDetailsScreen extends StatefulWidget {
  const WordDetailsScreen({super.key, required this.wordModel});

  final MapEntry<int, WordModel> wordModel;

  @override
  State<WordDetailsScreen> createState() => _WordDetailsScreenState();
}

class _WordDetailsScreenState extends State<WordDetailsScreen> {
  late MapEntry<int, WordModel> _wordModel;

  @override
  void initState() {
    _wordModel = widget.wordModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final WordModel word = _wordModel.value;

    return Scaffold(
      appBar: _getAppBar(context, word),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SafePadding.horizP(context)),
        child: BlocBuilder<ReadDataCubit, ReadDataState>(
          builder: (context, state) {
            if (state is ReadDataSuccess) {
              _wordModel = state.words.firstWhere(
                (e) => e.key == _wordModel.key,
              );
              return _getBodySuccess(_wordModel.key, _wordModel.value, context);
            }
            if (state is ReadDataFailure) {
              return ExeptionWidget(
                iconData: Icons.error,
                message: state.message,
              );
            }
            return const LoadingWidget();
          },
        ),
      ),
    );
  }

  ListView _getBodySuccess(int key, WordModel word, BuildContext context) {
    final writeCubit = context.read<WriteDataCubit>();
    final readCubit = context.read<ReadDataCubit>();

    return ListView(
      children: [
        _getLabelText(AppStrings.word, word.colorCode),
        AppSpacing.v_8,
        WordInfoWidget(
          colorCode: word.colorCode,
          text: word.text,
          isArabic: word.isArabic,
        ),
        AppSpacing.v_26,

        // similar words
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _getLabelText(AppStrings.similarWords, word.colorCode),
            UpdateWordButtonWidget(
              colorCode: word.colorCode,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => UpdateWordDialog(
                    isExample: false,
                    colorCode: word.colorCode,
                    indexKey: _wordModel.key,
                  ),
                );
              },
            ),
          ],
        ),
        AppSpacing.v_8,
        for (int i = 0; i < word.arabicSimilarWords.length; i++)
          WordInfoWidget(
            colorCode: word.colorCode,
            text: word.arabicSimilarWords[i],
            isArabic: true,
            onPressed: () {
              writeCubit.deleteSimilarWord(key, i, true);
              readCubit.getWords();
            },
          ),
        for (int i = 0; i < word.englishSimilarWords.length; i++)
          WordInfoWidget(
            colorCode: word.colorCode,
            text: word.englishSimilarWords[i],
            isArabic: false,
            onPressed: () {
              writeCubit.deleteSimilarWord(key, i, false);
              readCubit.getWords();
            },
          ),

        AppSpacing.v_26,

        // examples
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _getLabelText(AppStrings.examples, word.colorCode),
            UpdateWordButtonWidget(
              colorCode: word.colorCode,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => UpdateWordDialog(
                    isExample: true,
                    colorCode: word.colorCode,
                    indexKey: _wordModel.key,
                  ),
                );
              },
            ),
          ],
        ),
        AppSpacing.v_8,

        for (int i = 0; i < word.arabicExamples.length; i++)
          WordInfoWidget(
            colorCode: word.colorCode,
            text: word.arabicExamples[i],
            isArabic: true,
            onPressed: () {
              writeCubit.deleteExample(key, i, true);
              readCubit.getWords();
            },
          ),
        for (int i = 0; i < word.englishExamples.length; i++)
          WordInfoWidget(
            colorCode: word.colorCode,
            text: word.englishExamples[i],
            isArabic: false,
            onPressed: () {
              writeCubit.deleteExample(key, i, false);
              readCubit.getWords();
            },
          ),
      ],
    );
  }

  Text _getLabelText(String label, int colorCode) {
    return Text(
      label,
      style: TextStyle(
        color: Color(colorCode),
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  AppBar _getAppBar(BuildContext context, WordModel word) {
    return AppBar(
      foregroundColor: Color(word.colorCode),
      title: Text(
        AppStrings.wordDetails,
        style: TextStyle(color: Color(word.colorCode)),
      ),
      actions: [
        IconButton(
          onPressed: () => _deleteWord(context),
          icon: const Icon(Icons.delete),
        ),
      ],
    );
  }

  void _deleteWord(BuildContext context) {
    final writeCubit = context.read<WriteDataCubit>();
    writeCubit.deleteWord(_wordModel.key);
    Navigator.pop(context);
  }
}
