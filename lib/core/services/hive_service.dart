import 'package:hive/hive.dart';
import 'package:my_dictionary/data/hive_keys.dart';
import 'package:my_dictionary/data/models/word_model.dart';

class HiveService {
  late Box<WordModel> _wordsBox;

  Future<void> init() async {
    _wordsBox = Hive.box<WordModel>(HiveKeys.wordsBox);
  }

  // READ
  Map<int, WordModel> getAll() {
    return _wordsBox.toMap().cast<int, WordModel>();
  }

  WordModel? get(int key) {
    return _wordsBox.get(key);
  }

  // WRITE
  Future<void> add(WordModel word) async {
    await _wordsBox.add(word);
  }

  Future<void> put(int key, WordModel word) async {
    await _wordsBox.put(key, word);
  }

  Future<void> delete(int key) async {
    await _wordsBox.delete(key);
  }
}
