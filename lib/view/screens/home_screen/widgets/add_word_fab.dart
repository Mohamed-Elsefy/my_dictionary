import 'package:flutter/material.dart';
import 'package:my_dictionary/core/constants/app_colors.dart';
import 'package:my_dictionary/view/dialogs/add_word_dialog.dart';

class AddWordFAB extends StatelessWidget {
  const AddWordFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(context: context, builder: (_) => const AddWordDialog());
      },
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.background,
      shape: const CircleBorder(),
      child: const Icon(Icons.add),
    );
  }
}
