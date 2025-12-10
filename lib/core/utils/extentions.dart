import 'package:my_dictionary/controllers/read_data_cubit/read_data_cubit.dart';
import 'package:my_dictionary/core/constants/app_strings.dart';

extension LanguageFilterText on LanguageFilter {
  String get filterLabel {
    switch (this) {
      case LanguageFilter.arabicOnly:
        return AppStrings.arabicOnly;
      case LanguageFilter.englishOnly:
        return AppStrings.englishOnly;
      case LanguageFilter.allWords:
        return AppStrings.allWords;
    }
  }
}
