import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color primary = Colors.white;
  static const Color background = Color(0xff262626);
  static const Color danger = Color(0xfff44336);

  static const List<int> wordColors = [
    // 🔵 Blues
    0xFF4C6EF5,
    0xFF3B5BDB,

    // 🟢 Greens
    0xFF40C057,
    0xFF2F9E44,
    0xFF12B886,

    // 🟡 Yellows / Ambers
    0xFFF59F00,
    0xFFE67700,
    0xFFFFD43B,

    // 🔴 Reds / Pinks
    0xFFFA5252,
    0xFFE03131,
    0xFFE64980,

    // 🟣 Purples / Violets
    0xFFBE4BDB,

    // 🟠 Oranges
    0xFFFF6B6B,

    // 🌊 Teals / Cyans
    0xFF15AABF,
    0xFF0CA678,
    0xFF20C997,

    // ⚪ Neutrals (مناسبة للتوازن)
    0xFFADB5BD,
    0xFF868E96,
    0xFFCED4DA,
  ];
}
