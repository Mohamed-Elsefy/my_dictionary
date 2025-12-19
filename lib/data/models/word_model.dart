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

  WordModel copyWith({
    String? text,
    bool? isArabic,
    int? colorCode,
    List<String>? arabicSimilarWords,
    List<String>? englishSimilarWords,
    List<String>? arabicExamples,
    List<String>? englishExamples,
  }) {
    return WordModel(
      text: text ?? this.text,
      isArabic: isArabic ?? this.isArabic,
      colorCode: colorCode ?? this.colorCode,
      arabicSimilarWords:
          arabicSimilarWords ?? List<String>.from(this.arabicSimilarWords),
      englishSimilarWords:
          englishSimilarWords ?? List<String>.from(this.englishSimilarWords),
      arabicExamples: arabicExamples ?? List<String>.from(this.arabicExamples),
      englishExamples:
          englishExamples ?? List<String>.from(this.englishExamples),
    );
  }

  // helpers used by cubit (pure, return new instance)
  WordModel addSimilarWord(String txt, bool isArabic) {
    final newArabic = List<String>.from(arabicSimilarWords);
    final newEnglish = List<String>.from(englishSimilarWords);
    if (isArabic) {
      newArabic.add(txt);
    } else {
      newEnglish.add(txt);
    }
    return copyWith(
      arabicSimilarWords: newArabic,
      englishSimilarWords: newEnglish,
    );
  }

  WordModel deleteSimilarWord(int index, bool isArabic) {
    final newArabic = List<String>.from(arabicSimilarWords);
    final newEnglish = List<String>.from(englishSimilarWords);
    if (isArabic) {
      newArabic.removeAt(index);
    } else {
      newEnglish.removeAt(index);
    }
    return copyWith(
      arabicSimilarWords: newArabic,
      englishSimilarWords: newEnglish,
    );
  }

  WordModel addExample(String example, bool isArabic) {
    final newArabic = List<String>.from(arabicExamples);
    final newEnglish = List<String>.from(englishExamples);
    if (isArabic) {
      newArabic.add(example);
    } else {
      newEnglish.add(example);
    }
    return copyWith(arabicExamples: newArabic, englishExamples: newEnglish);
  }

  WordModel deleteExample(int index, bool isArabic) {
    final newArabic = List<String>.from(arabicExamples);
    final newEnglish = List<String>.from(englishExamples);
    if (isArabic) {
      newArabic.removeAt(index);
    } else {
      newEnglish.removeAt(index);
    }
    return copyWith(arabicExamples: newArabic, englishExamples: newEnglish);
  }

  @override
  String toString() {
    return 'WordModel(text: $text, isArabic: $isArabic, colorCode: $colorCode, '
        'arabicSimilarWords: $arabicSimilarWords, englishSimilarWords: $englishSimilarWords, '
        'arabicExamples: $arabicExamples, englishExamples: $englishExamples)';
  }
}
