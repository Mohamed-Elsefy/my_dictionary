import 'package:flutter/material.dart';
import 'package:my_dictionary/core/constants/app_colors.dart';
import 'package:my_dictionary/view/widgets/add_word_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _getFloatingActionButton(context),
      appBar: AppBar(title: const Text('Home')),
      body: const Column(children: []),
    );
  }

  FloatingActionButton _getFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => showDialog(
        context: context,
        builder: (context) => const AddWordDialog(),
      ),
      backgroundColor: AppColors.white,
      shape: const CircleBorder(),
      child: const Icon(Icons.add, color: AppColors.black),
    );
  }
}
