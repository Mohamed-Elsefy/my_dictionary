import 'package:flutter/material.dart';
import 'package:my_dictionary/core/constants/app_spacing.dart';
import 'package:my_dictionary/core/constants/app_strings.dart';
import 'package:my_dictionary/core/utils/safe_padding.dart';
import 'package:my_dictionary/view/screens/home_screen/widgets/add_word_fab.dart';
import 'package:my_dictionary/view/screens/home_screen/widgets/words_filter_bar.dart';
import 'package:my_dictionary/view/screens/home_screen/widgets/words_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.myDictionary)),

      floatingActionButton: const AddWordFAB(),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SafePadding.horizP(context)),
        child: const Column(
          children: [
            AppSpacing.v_8,

            WordsFilterBar(),

            AppSpacing.v_12,

            WordsGrid(),
          ],
        ),
      ),
    );
  }
}
