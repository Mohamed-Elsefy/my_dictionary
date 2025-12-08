class WordModel {
  final String text;
  final bool isArabic;
  final int colorCode;
  final List<String> arabicSimilarWords;
  final List<String> englishSimilarWords;
  final List<String> arabicExamples;
  final List<String> englishExamples;

  const WordModel({
    required this.text,
    required this.isArabic,
    required this.colorCode,
    this.arabicSimilarWords = const [],
    this.englishSimilarWords = const [],
    this.arabicExamples = const [],
    this.englishExamples = const [],
  });

  WordModel addSimilarWord(String text, bool isArabic) {
    final newArabicSimilarWords = List<String>.from(arabicSimilarWords);
    final newEnglishSimilarWords = List<String>.from(englishSimilarWords);

    if (isArabic) {
      newArabicSimilarWords.add(text);
    } else {
      newEnglishSimilarWords.add(text);
    }

    return WordModel(
      text: this.text,
      isArabic: this.isArabic,
      colorCode: colorCode,
      arabicSimilarWords: newArabicSimilarWords,
      englishSimilarWords: newEnglishSimilarWords,
      arabicExamples: arabicExamples,
      englishExamples: englishExamples,
    );
  }

  WordModel deleteSimilarWord(int index, bool isArabic) {
    final newArabicSimilarWords = List<String>.from(arabicSimilarWords);
    final newEnglishSimilarWords = List<String>.from(englishSimilarWords);

    if (isArabic) {
      newArabicSimilarWords.removeAt(index);
    } else {
      newEnglishSimilarWords.removeAt(index);
    }

    return WordModel(
      text: text,
      isArabic: this.isArabic,
      colorCode: colorCode,
      arabicSimilarWords: newArabicSimilarWords,
      englishSimilarWords: newEnglishSimilarWords,
      arabicExamples: arabicExamples,
      englishExamples: englishExamples,
    );
  }

  WordModel addExample(String example, bool isArabic) {
    final newArabicExamples = List<String>.from(arabicExamples);
    final newEnglishExamples = List<String>.from(englishExamples);

    if (isArabic) {
      newArabicExamples.add(example);
    } else {
      newEnglishExamples.add(example);
    }

    return WordModel(
      text: text,
      isArabic: this.isArabic,
      colorCode: colorCode,
      arabicSimilarWords: arabicSimilarWords,
      englishSimilarWords: englishSimilarWords,
      arabicExamples: newArabicExamples,
      englishExamples: newEnglishExamples,
    );
  }

  WordModel deleteExample(int index, bool isArabic) {
    final newArabicExamples = List<String>.from(arabicExamples);
    final newEnglishExamples = List<String>.from(englishExamples);

    if (isArabic) {
      newArabicExamples.removeAt(index);
    } else {
      newEnglishExamples.removeAt(index);
    }

    return WordModel(
      text: text,
      isArabic: this.isArabic,
      colorCode: colorCode,
      arabicSimilarWords: arabicSimilarWords,
      englishSimilarWords: englishSimilarWords,
      arabicExamples: newArabicExamples,
      englishExamples: newEnglishExamples,
    );
  }
}
