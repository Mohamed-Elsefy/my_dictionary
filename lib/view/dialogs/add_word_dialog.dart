import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_dictionary/controllers/read_data_cubit/read_data_cubit.dart';
import 'package:my_dictionary/controllers/write_data_cubit/write_data_cubit.dart';
import 'package:my_dictionary/core/constants/app_colors.dart';
import 'package:my_dictionary/core/constants/app_radius.dart';
import 'package:my_dictionary/core/constants/app_size.dart';
import 'package:my_dictionary/core/constants/app_spacing.dart';
import 'package:my_dictionary/core/constants/app_strings.dart';
import 'package:my_dictionary/core/constants/app_time.dart';
import 'package:my_dictionary/core/utils/navigation.dart';
import 'package:my_dictionary/data/models/word_model.dart';
import 'package:my_dictionary/view/widgets/color_picker_widget.dart';
import 'package:my_dictionary/view/widgets/done_button_widget.dart';
import 'package:my_dictionary/view/widgets/language_picker_widget.dart';
import 'package:my_dictionary/view/widgets/text_form_widget.dart';

class AddWordDialog extends StatefulWidget {
  const AddWordDialog({super.key});

  @override
  State<AddWordDialog> createState() => _AddWordDialogState();
}

class _AddWordDialogState extends State<AddWordDialog> {
  int _selectedColorCode = AppColors.wordColors.first;
  bool _isArabic = false;
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: AnimatedContainer(
        padding: const EdgeInsets.all(AppSpacing.p_8),
        width: AppSize.s_330,
        decoration: BoxDecoration(
          color: Color(_selectedColorCode),
          borderRadius: BorderRadius.circular(AppRadius.r_10),
        ),
        duration: const Duration(milliseconds: AppTime.milliseconds_700),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LanguagePickerWidget(
                isArabicSelected: _isArabic,
                onLanguageChanged: (value) {
                  setState(() {
                    _isArabic = value;
                  });
                },
                colorCode: _selectedColorCode,
              ),

              AppSpacing.v_12,

              ColorPickerWidget(
                selectedColorCode: _selectedColorCode,
                onColorSelected: (colorCode) =>
                    setState(() => _selectedColorCode = colorCode),
              ),

              AppSpacing.v_12,

              TextFormWidget(
                lable: AppStrings.newWord,
                controller: _textController,
                isArabic: _isArabic,
                formKey: _formKey,
              ),

              AppSpacing.v_20,

              DoneButtonWidget(
                onPressed: () {
                  if (!_formKey.currentState!.validate()) return;

                  final text = _textController.text.trim();
                  final WordModel word = WordModel(
                    text: text,
                    isArabic: _isArabic,
                    colorCode: _selectedColorCode,
                  );

                  context.read<WriteDataCubit>().addWord(word);
                  context.read<ReadDataCubit>().loadWords();

                  Navigation.pop(context);
                },
                colorCode: _selectedColorCode,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
