import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_dictionary/controllers/write_data_cubit/write_data_cubit.dart';
import 'package:my_dictionary/core/constants/app_colors.dart';
import 'package:my_dictionary/core/constants/app_radius.dart';
import 'package:my_dictionary/core/utils/validator.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({super.key, required this.lable, required this.formKey});

  final String lable;
  final GlobalKey<FormState> formKey;

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final writeCubit = context.read<WriteDataCubit>();

    return Form(
      key: widget.formKey,
      child: TextFormField(
        controller: textEditingController,
        onChanged: (value) => writeCubit.updateText(value),
        validator: (value) {
          return validator(value, writeCubit.isArabic);
        },
        minLines: 1,
        maxLines: 2,
        cursorColor: AppColors.white,
        style: Theme.of(context).textTheme.bodyMedium,
        decoration: InputDecoration(
          label: Text(
            widget.lable,
            style: const TextStyle(color: AppColors.white),
          ),
          enabledBorder: _border(AppColors.white),
          focusedBorder: _border(AppColors.white),
          errorBorder: _border(AppColors.red),
          focusedErrorBorder: _border(AppColors.red),
        ),
      ),
    );
  }

  OutlineInputBorder _border(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.r_20),
      borderSide: BorderSide(color: color, width: 2),
    );
  }
}
