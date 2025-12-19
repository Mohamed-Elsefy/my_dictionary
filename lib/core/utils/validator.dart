import 'package:my_dictionary/core/constants/app_strings.dart';

abstract class Validator {
  static String? isArabicOrEnglishValidate(String? value, bool isArabic) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.thisFieldRequired;
    }

    final text = value.trim();
    final arabicRegex = RegExp(r'^[\u0600-\u06FF\s]+$');
    final englishRegex = RegExp(r'^[a-zA-Z\s]+$');

    if (isArabic && !arabicRegex.hasMatch(text)) {
      return AppStrings.pleaseEnterArabic;
    }

    if (!isArabic && !englishRegex.hasMatch(text)) {
      return AppStrings.pleaseEnterEnglis;
    }

    return null;
  }
}
