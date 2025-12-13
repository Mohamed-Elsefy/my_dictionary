import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_dictionary/controllers/read_data_cubit/read_data_cubit.dart';
import 'package:my_dictionary/controllers/write_data_cubit/write_data_cubit.dart';
import 'package:my_dictionary/controllers/write_data_cubit/write_data_state.dart';
import 'package:my_dictionary/core/constants/app_radius.dart';
import 'package:my_dictionary/core/constants/app_size.dart';
import 'package:my_dictionary/core/constants/app_spacing.dart';
import 'package:my_dictionary/core/constants/app_strings.dart';
import 'package:my_dictionary/core/utils/snak_bar.dart';
import 'package:my_dictionary/view/widgets/arabic_or_english_widget.dart';
import 'package:my_dictionary/view/widgets/custom_form.dart';
import 'package:my_dictionary/view/widgets/done_button_widget.dart';

class UpdateWordDialog extends StatefulWidget {
  const UpdateWordDialog({
    super.key,
    required this.isExample,
    required this.colorCode,
    required this.indexKey,
  });

  final bool isExample;
  final int colorCode;
  final int indexKey;

  @override
  State<UpdateWordDialog> createState() => _UpdateWordDialogState();
}

class _UpdateWordDialogState extends State<UpdateWordDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final writeCubit = context.read<WriteDataCubit>();

    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: BlocConsumer<WriteDataCubit, WriteDataState>(
        listener: (context, state) {
          if (state is WriteDataSuccess) {
            Navigator.pop(context);
          } else if (state is WriteDataFailure) {
            snakBar(context, state.message);
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Container(
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
                  ArabicOrEnglishWidget(
                    colorCode: widget.colorCode,
                    isArabic: writeCubit.isArabic,
                  ),
                  AppSpacing.v_16,

                  CustomForm(
                    lable: widget.isExample
                        ? AppStrings.addNewExample
                        : AppStrings.addNewSimilarWord,
                    formKey: _formKey,
                  ),
                  AppSpacing.v_16,

                  DoneButtonWidget(
                    colorCode: widget.colorCode,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (widget.isExample) {
                          writeCubit.addExample(widget.indexKey);
                        } else {
                          writeCubit.addSimilarWord(widget.indexKey);
                        }
                        context.read<ReadDataCubit>().getWords();
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
