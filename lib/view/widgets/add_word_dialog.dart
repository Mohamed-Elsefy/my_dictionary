import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_dictionary/controllers/read_data_cubit/read_data_cubit.dart';
import 'package:my_dictionary/controllers/write_data_cubit/write_data_cubit.dart';
import 'package:my_dictionary/controllers/write_data_cubit/write_data_state.dart';
import 'package:my_dictionary/core/constants/app_strings.dart';
import 'package:my_dictionary/core/constants/app_radius.dart';
import 'package:my_dictionary/core/constants/app_size.dart';
import 'package:my_dictionary/core/constants/app_spacing.dart';
import 'package:my_dictionary/core/constants/time.dart';
import 'package:my_dictionary/core/utils/snak_bar.dart';
import 'package:my_dictionary/view/widgets/arabic_or_english_widget.dart';
import 'package:my_dictionary/view/widgets/colors_widget.dart';
import 'package:my_dictionary/view/widgets/custom_form.dart';
import 'package:my_dictionary/view/widgets/done_button_widget.dart';

class AddWordDialog extends StatefulWidget {
  const AddWordDialog({super.key});

  @override
  State<AddWordDialog> createState() => _AddWordDialogState();
}

class _AddWordDialogState extends State<AddWordDialog> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
          return AnimatedContainer(
            duration: const Duration(milliseconds: Time.milliseconds_700),
            padding: const EdgeInsets.all(AppSpacing.p_8),
            width: AppSize.s_330,
            decoration: BoxDecoration(
              color: Color(writeCubit.colorCode),
              borderRadius: BorderRadius.circular(AppRadius.r_10),
            ),

            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ArabicOrEnglishWidget(
                    colorCode: writeCubit.colorCode,
                    isArabic: writeCubit.isArabic,
                  ),
                  AppSpacing.v_16,

                  ColorsWidget(activeColorCode: writeCubit.colorCode),
                  AppSpacing.v_16,

                  CustomForm(lable: AppStrings.newWord, formKey: formKey),
                  AppSpacing.v_16,

                  DoneButtonWidget(
                    colorCode: writeCubit.colorCode,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        writeCubit.addWord();
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
