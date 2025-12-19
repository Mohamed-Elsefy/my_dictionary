import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_dictionary/controllers/write_data_cubit/write_data_cubit.dart';
import 'package:my_dictionary/core/constants/app_radius.dart';
import 'package:my_dictionary/core/constants/app_size.dart';
import 'package:my_dictionary/core/constants/app_spacing.dart';
import 'package:my_dictionary/core/constants/app_strings.dart';
import 'package:my_dictionary/view/widgets/done_button_widget.dart';
import 'package:my_dictionary/view/widgets/language_picker_widget.dart';
import 'package:my_dictionary/view/widgets/text_form_widget.dart';

class AddExampleSimilarWordDialog extends StatefulWidget {
  const AddExampleSimilarWordDialog({
    super.key,
    required this.wordKey,
    required this.colorCode,
    required this.isExample,
  });

  final int wordKey;
  final int colorCode;
  final bool isExample;

  @override
  State<AddExampleSimilarWordDialog> createState() =>
      _AddExampleSimilarWordDialogState();
}

class _AddExampleSimilarWordDialogState
    extends State<AddExampleSimilarWordDialog> {
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();
  bool _isArabic = false;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final writeCubit = context.read<WriteDataCubit>();

    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.p_20),
        width: AppSize.s_330,
        decoration: BoxDecoration(
          color: Color(widget.colorCode),
          borderRadius: BorderRadius.circular(AppRadius.r_10),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LanguagePickerWidget(
                isArabicSelected: _isArabic,
                onLanguageChanged: (value) => setState(() => _isArabic = value),
                colorCode: widget.colorCode,
              ),

              AppSpacing.v_12,

              TextFormWidget(
                lable: widget.isExample
                    ? AppStrings.addNewExample
                    : AppStrings.addNewSimilarWord,
                controller: _textController,
                isArabic: _isArabic,
                formKey: _formKey,
              ),

              AppSpacing.v_12,

              DoneButtonWidget(
                onPressed: () async {
                  if (!_formKey.currentState!.validate()) return;

                  final text = _textController.text.trim();

                  if (widget.isExample) {
                    await writeCubit.addExample(
                      key: widget.wordKey,
                      example: text,
                      isArabic: _isArabic,
                    );
                  } else {
                    await writeCubit.addSimilarWord(
                      key: widget.wordKey,
                      text: text,
                      isArabic: _isArabic,
                    );
                  }

                  Navigator.pop(context);
                },
                colorCode: widget.colorCode,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
