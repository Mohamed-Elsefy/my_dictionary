import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_dictionary/constants/app_strings.dart';
import 'package:my_dictionary/constants/hive_keys.dart';
import 'package:my_dictionary/controllers/read_data_cubit/read_data_state.dart';
import 'package:my_dictionary/model/word_model.dart';

class ReadDataCubit extends Cubit<ReadDataState> {
  ReadDataCubit() : super(ReadDataInitial());

  final Box _box = Hive.box(HiveKeys.wordsBox);
  LanguageFilter languageFilter = LanguageFilter.allWords;
  SortedBy sortedBy = SortedBy.time;
  SortingType sortingType = SortingType.descending;

  void updateLanguageFilter(LanguageFilter languageFilter) =>
      this.languageFilter = languageFilter;

  void updateSortedBy(SortedBy sortedBy) => this.sortedBy = sortedBy;

  void updateSortingType(SortingType sortingType) =>
      this.sortingType = sortingType;

  void getWords() {
    emit(ReadDataLoading());

    try {
      final wordsMap = _box.toMap().cast<int, WordModel>();
      List<MapEntry<int, WordModel>> wordsEntries = wordsMap.entries.toList();

      wordsEntries = _filter(wordsEntries);
      wordsEntries = _sort(wordsEntries);

      emit(ReadDataSuccess(words: wordsEntries));
    } catch (e) {
      emit(ReadDataFailure(message: AppStrings.thereIsProblem));
    }
  }

  List<MapEntry<int, WordModel>> _filter(List<MapEntry<int, WordModel>> list) {
    if (languageFilter == LanguageFilter.allWords) return list;

    return list.where((entry) {
      final w = entry.value;
      if (languageFilter == LanguageFilter.arabicOnly && w.isArabic) {
        return true;
      }
      if (languageFilter == LanguageFilter.englishOnly && !w.isArabic) {
        return true;
      }
      return false;
    }).toList();
  }

  List<MapEntry<int, WordModel>> _sort(List<MapEntry<int, WordModel>> list) {
    if (sortedBy == SortedBy.time) {
      list.sort((a, b) => a.key.compareTo(b.key));
    } else {
      list.sort((a, b) => a.value.text.length.compareTo(b.value.text.length));
    }

    if (sortingType == SortingType.descending) {
      return list.reversed.toList();
    }

    return list;
  }
}

enum LanguageFilter { arabicOnly, englishOnly, allWords }

enum SortedBy { time, wordLength }

enum SortingType { ascending, descending }
