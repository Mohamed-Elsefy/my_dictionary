import 'package:flutter/material.dart';

abstract class AppSpacing {
  // padding
  static const double p_8 = 8;
  static const double p_14 = 14;
  static const double p_20 = 20;

  // Vertical spacing
  static const SizedBox v_8 = SizedBox(height: 8);
  static const SizedBox v_16 = SizedBox(height: 16);

  // Horizontal spacing
  static const SizedBox h_8 = SizedBox(width: 8);
  static const SizedBox h_16 = SizedBox(width: 16);
}
