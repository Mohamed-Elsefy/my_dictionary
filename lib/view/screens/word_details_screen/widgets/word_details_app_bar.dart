import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_dictionary/controllers/write_data_cubit/write_data_cubit.dart';
import 'package:my_dictionary/core/constants/app_size.dart';
import 'package:my_dictionary/core/constants/app_strings.dart';
import 'package:my_dictionary/core/utils/navigation.dart';
import 'package:my_dictionary/view/dialogs/confirm_delete_dialog.dart';

class WordDetailsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WordDetailsAppBar({
    super.key,
    required this.wordKey,
    required this.colorCode,
  });

  final int wordKey;
  final int colorCode;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final writeCubit = context.read<WriteDataCubit>();

    return AppBar(
      foregroundColor: Color(colorCode),
      title: Text(
        AppStrings.wordDetails,
        style: TextStyle(color: Color(colorCode)),
      ),
      actions: [
        IconButton(
          onPressed: () async {
            final confirmed = await confirmDeleteDialog(context);

            if (confirmed == true) {
              writeCubit.deleteWord(wordKey);
              Navigation.pop(context, true);
            }
          },
          color: Color(colorCode),
          iconSize: AppSize.s_33,
          icon: const Icon(Icons.delete),
        ),
      ],
    );
  }
}
