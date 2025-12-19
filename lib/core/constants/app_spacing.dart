import 'package:flutter/material.dart';

abstract class AppSpacing {
  // padding
  static const double p_8 = 8;
  static const double p_14 = 14;
  static const double p_20 = 20;

  // Vertical spacing
  static const SizedBox v_8 = SizedBox(height: 8);
  static const SizedBox v_12 = SizedBox(height: 12);
  static const SizedBox v_16 = SizedBox(height: 16);
  static const SizedBox v_20 = SizedBox(height: 20);
  static const SizedBox v_40 = SizedBox(height: 40);

  // Horizontal spacing
  static const SizedBox h_8 = SizedBox(width: 8);
  static const SizedBox h_12 = SizedBox(width: 12);
  static const SizedBox h_16 = SizedBox(width: 16);
  static const SizedBox h_20 = SizedBox(width: 20);
  static const SizedBox h_40 = SizedBox(width: 40);
}
