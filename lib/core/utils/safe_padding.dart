import 'package:flutter/material.dart';

abstract class SafePadding {
  static double topPadding(BuildContext context) =>
      MediaQuery.of(context).padding.top;

  static double bottomPadding(BuildContext context) =>
      MediaQuery.of(context).padding.bottom;

  static double leftPadding(BuildContext context) =>
      MediaQuery.of(context).padding.left;

  static double rightPadding(BuildContext context) =>
      MediaQuery.of(context).padding.right;

  static EdgeInsets allPadding(BuildContext context) =>
      MediaQuery.of(context).padding;

  static double horizontalPadding(
    BuildContext context, {
    double factor = 0.06,
  }) => MediaQuery.sizeOf(context).width * factor;

  static double verticalPadding(BuildContext context, {double factor = 0.04}) =>
      MediaQuery.sizeOf(context).height * factor;
}
