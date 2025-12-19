import 'package:flutter/material.dart';
import 'package:my_dictionary/core/constants/app_colors.dart';
import 'package:my_dictionary/core/constants/app_radius.dart';
import 'package:my_dictionary/core/constants/app_strings.dart';
import 'package:my_dictionary/core/utils/navigation.dart';
import 'package:my_dictionary/view/widgets/text_button_widget.dart';

Future<bool?> confirmDeleteDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (_) => Dialog(
      backgroundColor: AppColors.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.r_10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButtonWidget(
            text: AppStrings.cancel,
            onPressed: () => Navigation.pop(context, false),
          ),
          TextButtonWidget(
            text: AppStrings.delete,
            onPressed: () => Navigation.pop(context, true),
          ),
        ],
      ),
    ),
  );
}
