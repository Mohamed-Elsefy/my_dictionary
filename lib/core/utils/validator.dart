import 'package:my_dictionary/core/constants/app_strings.dart';

enum CharType { arabic, english, space, notValid }

String? validator(String? value, bool isArabic) {
  if (value == null || value.trim().isEmpty) {
    return AppStrings.thisFieldHasNotEmpty;
  }

  for (var i = 0; i < value.length; i++) {
    CharType charType = _getCharType(value.codeUnitAt(i));

    // arabic char in english word
    if (charType == CharType.arabic && !isArabic) {
      return '"${value[i]}" ${AppStrings.isNotEnglishChar}';
    }

    // english char in arabic word
    if (charType == CharType.english && isArabic) {
      return '"${value[i]}" ${AppStrings.isNotArabicChar}';
    }

    // valid char
    if (charType == CharType.notValid) {
      return '"${value[i]}" ${AppStrings.isNotRightChar}';
    }
  }

  return null;
}

CharType _getCharType(int code) {
  if ((code >= 65 && code <= 90) || (code >= 97 && code <= 122)) {
    return CharType.english;
  } else if (code >= 1569 && code <= 1610) {
    return CharType.arabic;
  } else if (code == 32) {
    return CharType.space;
  }
  return CharType.notValid;
}
