import 'package:flutter/material.dart';

abstract class SafePadding {
  static double topP(BuildContext context) =>
      MediaQuery.of(context).padding.top;

  static double bottomP(BuildContext context) =>
      MediaQuery.of(context).padding.bottom;

  static double leftP(BuildContext context) =>
      MediaQuery.of(context).padding.left;

  static double rightP(BuildContext context) =>
      MediaQuery.of(context).padding.right;

  static double horizP(BuildContext context, {double factor = 0.04}) =>
      MediaQuery.sizeOf(context).width * factor;

  static double vertP(BuildContext context, {double factor = 0.04}) =>
      MediaQuery.sizeOf(context).height * factor;
}
