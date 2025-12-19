import 'package:flutter/material.dart';
import 'package:my_dictionary/core/utils/extentions.dart';

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text, style: context.textTheme.bodyMedium),
    );
  }
}
