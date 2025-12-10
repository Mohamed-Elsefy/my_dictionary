import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:my_dictionary/core/constants/app_strings.dart';
import 'package:my_dictionary/core/constants/hive_keys.dart';
import 'package:my_dictionary/controllers/write_data_cubit/write_data_state.dart';
import 'package:my_dictionary/model/word_model.dart';

class WriteDataCubit extends Cubit<WriteDataState> {
  WriteDataCubit() : super(WriteDataInitial());

  Box<WordModel> get _box => Hive.box<WordModel>(HiveKeys.wordsBox);
  String text = '';
  bool isArabic = true;
  int colorCode = 0XFF4A47A3;

  void updateText(String text) {
    this.text = text;
    emit(UpdateTextState());
  }

  void updateIsArabic(bool isArabic) {
    this.isArabic = isArabic;
    emit(UpdateIsArabicState());
  }

  void updateColorCode(int colorCode) {
    this.colorCode = colorCode;
    emit(UpdateColorState());
  }

  void addWord() {
    _tryAndCatchBlock(() async {
      final word = WordModel(
        text: text,
        isArabic: isArabic,
        colorCode: colorCode,
      );
      await _box.add(word);
    });
  }

  void deleteWord(int key) {
    _tryAndCatchBlock(() async {
      await _box.delete(key);
    });
  }

  void addSimilarWord(int key) {
    _updateWord(key, (w) => w.addSimilarWord(text, isArabic));
  }

  void deleteSimilarWord(int key, int index, bool isArabic) {
    _updateWord(key, (w) => w.deleteSimilarWord(index, isArabic));
  }

  void addExample(int key) {
    _updateWord(key, (w) => w.addExample(text, isArabic));
  }

  void deleteExample(int key, int index, bool isArabic) {
    _updateWord(key, (w) => w.deleteExample(index, isArabic));
  }

  Future<void> _tryAndCatchBlock(
    Future<void> Function() methodToExecute,
  ) async {
    emit(WriteDataLoading());
    try {
      await methodToExecute();
      emit(WriteDataSuccess());
    } catch (_) {
      emit(WriteDataFailure(message: AppStrings.thereIsProblem));
    }
  }

  Future<void> _updateWord(
    int key,
    WordModel Function(WordModel oldWord) updateFn,
  ) async {
    _tryAndCatchBlock(() async {
      final WordModel? oldWord = _box.get(key);
      if (oldWord == null) throw Exception();

      final updatedWord = updateFn(oldWord);
      await _box.put(key, updatedWord);
    });
  }
}
