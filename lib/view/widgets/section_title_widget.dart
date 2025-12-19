import 'package:flutter/material.dart';
import 'package:my_dictionary/core/utils/extentions.dart';

class SectionTitleWidget extends StatelessWidget {
  const SectionTitleWidget({
    super.key,
    required this.title,
    required this.colorCode,
  });

  final String title;
  final int colorCode;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.textTheme.titleLarge!.copyWith(color: Color(colorCode)),
    );
  }
}
