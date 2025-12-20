import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_dictionary/controllers/write_data_cubit/write_data_cubit.dart';
import 'package:my_dictionary/core/constants/app_radius.dart';
import 'package:my_dictionary/core/constants/app_size.dart';
import 'package:my_dictionary/core/constants/app_spacing.dart';
import 'package:my_dictionary/core/constants/app_strings.dart';
import 'package:my_dictionary/data/models/word_model.dart';
import 'package:my_dictionary/view/widgets/color_picker_widget.dart';
import 'package:my_dictionary/view/widgets/done_button_widget.dart';
import 'package:my_dictionary/view/widgets/language_picker_widget.dart';
import 'package:my_dictionary/view/widgets/text_form_widget.dart';

class UpdateWordDialog extends StatefulWidget {
  const UpdateWordDialog({
    super.key,
    required this.wordKey,
    required this.word,
  });

  final int wordKey;
  final WordModel word;

  @override
  State<UpdateWordDialog> createState() => _UpdateWordDialogState();
}

class _UpdateWordDialogState extends State<UpdateWordDialog> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _textController = TextEditingController();
  late bool _isArabic;
  late int _selectedColorCode;

  @override
  void initState() {
    super.initState();
    _textController.text = widget.word.text;
    _isArabic = widget.word.isArabic;
    _selectedColorCode = widget.word.colorCode;
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: Container(
        width: AppSize.s_330,
        padding: const EdgeInsets.all(AppSpacing.p_20),
        decoration: BoxDecoration(
          color: Color(_selectedColorCode),
          borderRadius: BorderRadius.circular(AppRadius.r_10),
        ),
        child: SingleChildScrollView(
          child: Column(
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
                onColorSelected: (colorCode) {
                  setState(() {
                    _selectedColorCode = colorCode;
                  });
                },
              ),

              AppSpacing.v_12,

              TextFormWidget(
                lable: AppStrings.updateWord,
                controller: _textController,
                isArabic: _isArabic,
                formKey: _formKey,
              ),

              AppSpacing.v_20,

              DoneButtonWidget(
                colorCode: _selectedColorCode,
                onPressed: () {
                  if (!_formKey.currentState!.validate()) return;

                  final updatedWord = widget.word.copyWith(
                    text: _textController.text.trim(),
                    isArabic: _isArabic,
                    colorCode: _selectedColorCode,
                  );

                  context.read<WriteDataCubit>().updateWord(
                    widget.wordKey,
                    updatedWord,
                  );

                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
