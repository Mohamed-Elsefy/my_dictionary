import 'package:flutter/material.dart';

void snakBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message, style: const TextStyle(fontSize: 16))),
  );
}
