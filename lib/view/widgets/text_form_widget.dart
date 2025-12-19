import 'package:flutter/material.dart';
import 'package:my_dictionary/core/constants/app_colors.dart';
import 'package:my_dictionary/core/constants/app_radius.dart';
import 'package:my_dictionary/core/utils/extentions.dart';
import 'package:my_dictionary/core/utils/validator.dart';

class TextFormWidget extends StatelessWidget {
  const TextFormWidget({
    super.key,
    required this.lable,
    required this.controller,
    required this.isArabic,
    required this.formKey,
  });

  final String lable;
  final TextEditingController controller;
  final bool isArabic;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: TextFormField(
        controller: controller,
        autofocus: true,
        minLines: 1,
        maxLines: 2,
        cursorColor: AppColors.primary,
        style: context.textTheme.bodyMedium,
        decoration: InputDecoration(
          labelText: lable,
          labelStyle: context.textTheme.bodySmall,
          enabledBorder: _border(AppColors.primary),
          focusedBorder: _border(AppColors.primary),
          errorBorder: _border(AppColors.danger),
          focusedErrorBorder: _border(AppColors.danger),
        ),
        validator: (value) =>
            Validator.isArabicOrEnglishValidate(value, isArabic),
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
