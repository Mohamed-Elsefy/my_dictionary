import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_dictionary/controllers/read_data_cubit/read_data_state.dart';
import 'package:my_dictionary/core/services/hive_service.dart';
import 'package:my_dictionary/data/models/word_model.dart';

enum SortType { newest, oldest, alphabetical }

enum LanguageFilter { all, arabic, english }

class ReadDataCubit extends Cubit<ReadDataState> {
  ReadDataCubit(this._hive) : super(ReadDataInitial());

  final HiveService _hive;

  // --------------------------------------------------
  // Filters & Sort (in-memory)

  SortType _sortType = SortType.newest;
  LanguageFilter _languageFilter = LanguageFilter.all;
  String _searchQuery = '';

  // --------------------------------------------------
  // Public API

  SortType get sortType => _sortType;

  LanguageFilter get languageFilter => _languageFilter;

  String get searchQuery => _searchQuery;

  Future<void> loadWords() async {
    emit(ReadDataLoading());
    try {
      _emitProcessedWords();
    } catch (e) {
      emit(ReadDataFailure(e.toString()));
    }
  }

  void setSortType(SortType type) {
    _sortType = type;
    _emitProcessedWords();
  }

  void setLanguageFilter(LanguageFilter filter) {
    _languageFilter = filter;
    _emitProcessedWords();
  }

  void setSearchQuery(String query) {
    _searchQuery = query.trim();
    _emitProcessedWords();
  }

  void clearFilters() {
    _sortType = SortType.newest;
    _languageFilter = LanguageFilter.all;
    _searchQuery = '';
    _emitProcessedWords();
  }

  // --------------------------------------------------
  // Core processing

  void _emitProcessedWords() {
    final boxMap = _hive.getAll();

    final entries = boxMap.entries.toList();
    final filtered = _applyFilters(entries);
    final sorted = _applySort(filtered);

    emit(ReadDataSuccess(sorted));
  }

  List<MapEntry<int, WordModel>> _applyFilters(
    List<MapEntry<int, WordModel>> words,
  ) {
    return words.where((entry) {
      final word = entry.value;

      if (_languageFilter == LanguageFilter.arabic && !word.isArabic) {
        return false;
      }
      if (_languageFilter == LanguageFilter.english && word.isArabic) {
        return false;
      }

      if (_searchQuery.isNotEmpty) {
        return word.text.toLowerCase().contains(_searchQuery.toLowerCase());
      }

      return true;
    }).toList();
  }

  List<MapEntry<int, WordModel>> _applySort(
    List<MapEntry<int, WordModel>> words,
  ) {
    switch (_sortType) {
      case SortType.oldest:
        words.sort((a, b) => a.key.compareTo(b.key));

      case SortType.alphabetical:
        words.sort(
          (a, b) =>
              a.value.text.toLowerCase().compareTo(b.value.text.toLowerCase()),
        );

      case SortType.newest:
        words.sort((a, b) => b.key.compareTo(a.key));
    }

    return words;
  }
}
