class WordModel {
  final int indexAtDatabase;
  final String text;
  final bool isArabic;
  final int colorCode;
  final List<String> arabicSimilarWords;
  final List<String> englishSimilarWords;
  final List<String> arabicExamples;
  final List<String> englishExamples;

  const WordModel({
    required this.indexAtDatabase,
    required this.text,
    required this.isArabic,
    required this.colorCode,
    this.arabicSimilarWords = const [],
    this.englishSimilarWords = const [],
    this.arabicExamples = const [],
    this.englishExamples = const [],
  });

  WordModel decrementIndexAtDatabase() {
    return WordModel(
      indexAtDatabase: indexAtDatabase - 1,
      text: text,
      isArabic: isArabic,
      colorCode: colorCode,
      arabicSimilarWords: arabicSimilarWords,
      englishSimilarWords: englishSimilarWords,
      arabicExamples: arabicExamples,
      englishExamples: englishExamples,
    );
  }

  WordModel addSimilarWord(String word, bool isArabicWord) {
    final newArabicSimilarWords = List<String>.from(arabicSimilarWords);
    final newEnglishSimilarWords = List<String>.from(englishSimilarWords);

    if (isArabicWord) {
      newArabicSimilarWords.add(word);
    } else {
      newEnglishSimilarWords.add(word);
    }

    return WordModel(
      indexAtDatabase: indexAtDatabase,
      text: text,
      isArabic: isArabic,
      colorCode: colorCode,
      arabicSimilarWords: newArabicSimilarWords,
      englishSimilarWords: newEnglishSimilarWords,
      arabicExamples: arabicExamples,
      englishExamples: englishExamples,
    );
  }

  WordModel deleteSimilarWord(int index, bool isArabicWord) {
    final newArabicSimilarWords = List<String>.from(arabicSimilarWords);
    final newEnglishSimilarWords = List<String>.from(englishSimilarWords);

    if (isArabicWord) {
      newArabicSimilarWords.removeAt(index);
    } else {
      newEnglishSimilarWords.removeAt(index);
    }

    return WordModel(
      indexAtDatabase: indexAtDatabase,
      text: text,
      isArabic: isArabic,
      colorCode: colorCode,
      arabicSimilarWords: newArabicSimilarWords,
      englishSimilarWords: newEnglishSimilarWords,
      arabicExamples: arabicExamples,
      englishExamples: englishExamples,
    );
  }

  WordModel addExample(String example, bool isArabicExample) {
    final newArabicExamples = List<String>.from(arabicExamples);
    final newEnglishExamples = List<String>.from(englishExamples);

    if (isArabicExample) {
      newArabicExamples.add(example);
    } else {
      newEnglishExamples.add(example);
    }

    return WordModel(
      indexAtDatabase: indexAtDatabase,
      text: text,
      isArabic: isArabic,
      colorCode: colorCode,
      arabicSimilarWords: arabicSimilarWords,
      englishSimilarWords: englishSimilarWords,
      arabicExamples: newArabicExamples,
      englishExamples: newEnglishExamples,
    );
  }

  WordModel deleteExample(int index, bool isArabicExample) {
    final newArabicExamples = List<String>.from(arabicExamples);
    final newEnglishExamples = List<String>.from(englishExamples);

    if (isArabicExample) {
      newArabicExamples.removeAt(index);
    } else {
      newEnglishExamples.removeAt(index);
    }

    return WordModel(
      indexAtDatabase: indexAtDatabase,
      text: text,
      isArabic: isArabic,
      colorCode: colorCode,
      arabicSimilarWords: arabicSimilarWords,
      englishSimilarWords: englishSimilarWords,
      arabicExamples: newArabicExamples,
      englishExamples: newEnglishExamples,
    );
  }
}
