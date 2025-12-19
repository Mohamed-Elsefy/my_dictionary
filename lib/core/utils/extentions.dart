import 'package:flutter/material.dart';
import 'package:my_dictionary/controllers/read_data_cubit/read_data_cubit.dart';
import 'package:my_dictionary/core/constants/app_strings.dart';

// get text theme
extension TextThemeExt on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}

// language filter
extension LanguageFilterExt on LanguageFilter {
  String get getLabel {
    switch (this) {
      case LanguageFilter.all:
        return AppStrings.allWords;
      case LanguageFilter.arabic:
        return AppStrings.arabic;
      case LanguageFilter.english:
        return AppStrings.english;
    }
  }
}

// sorted Type filter
extension SortTypeExt on SortType {
  String get getLabel {
    switch (this) {
      case SortType.newest:
        return AppStrings.newest;
      case SortType.oldest:
        return AppStrings.oldest;
      case SortType.alphabetical:
        return AppStrings.alphabetical;
    }
  }
}
