import 'package:my_dictionary/core/constants/app_strings.dart';

abstract class Validator {
  static String? isArabicOrEnglishValidate(String? value, bool isArabic) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.thisFieldRequired;
    }

    final text = value.trim();
    final lettersOnly = text.replaceAll(RegExp(r'[^a-zA-Z\u0600-\u06FF]'), '');
    final arabicLetters = RegExp(r'^[\u0600-\u06FF]+$');
    final englishLetters = RegExp(r'^[a-zA-Z]+$');

    if (lettersOnly.isEmpty) {
      return AppStrings.thisFieldRequired;
    }

    if (isArabic && !arabicLetters.hasMatch(lettersOnly)) {
      return AppStrings.pleaseEnterArabic;
    }

    if (!isArabic && !englishLetters.hasMatch(lettersOnly)) {
      return AppStrings.pleaseEnterEnglis;
    }

    return null;
  }
}
