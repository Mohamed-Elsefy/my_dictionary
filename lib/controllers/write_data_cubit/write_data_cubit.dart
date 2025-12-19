import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_dictionary/controllers/write_data_cubit/write_data_state.dart';
import 'package:my_dictionary/core/services/hive_service.dart';
import 'package:my_dictionary/data/models/word_model.dart';

class WriteDataCubit extends Cubit<WriteDataState> {
  WriteDataCubit(this._hive) : super(WriteDataInitial());

  final HiveService _hive;

  // --------------------------------------------------
  // Public API (Write actions)

  Future<void> addWord(WordModel word) async {
    await _execute(() async {
      await _hive.add(word);
    });
  }

  Future<void> updateWord(int key, WordModel updated) async {
    await _execute(() async {
      await _hive.put(key, updated);
    });
  }

  Future<void> deleteWord(int key) async {
    await _execute(() async {
      await _hive.delete(key);
    });
  }

  Future<void> addSimilarWord({
    required int key,
    required String text,
    required bool isArabic,
  }) async {
    await _execute(() async {
      final word = _requireWord(key);
      final updated = word.addSimilarWord(text, isArabic);
      await _hive.put(key, updated);
    });
  }

  Future<void> deleteSimilarWord({
    required int key,
    required int index,
    required bool isArabic,
  }) async {
    await _execute(() async {
      final word = _requireWord(key);
      final updated = word.deleteSimilarWord(index, isArabic);
      await _hive.put(key, updated);
    });
  }

  Future<void> addExample({
    required int key,
    required String example,
    required bool isArabic,
  }) async {
    await _execute(() async {
      final word = _requireWord(key);
      final updated = word.addExample(example, isArabic);
      await _hive.put(key, updated);
    });
  }

  Future<void> deleteExample({
    required int key,
    required int index,
    required bool isArabic,
  }) async {
    await _execute(() async {
      final word = _requireWord(key);
      final updated = word.deleteExample(index, isArabic);
      await _hive.put(key, updated);
    });
  }

  // --------------------------------------------------
  // Internal helpers

  WordModel _requireWord(int key) {
    final word = _hive.get(key);
    if (word == null) {
      throw Exception('Word not found for key: $key');
    }
    return word;
  }

  Future<void> _execute(Future<void> Function() action) async {
    emit(WriteDataLoading());
    try {
      await action();
      emit(WriteDataSuccess());
    } catch (e) {
      emit(WriteDataFailure(e.toString()));
    }
  }
}
