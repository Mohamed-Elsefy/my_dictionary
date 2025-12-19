import 'package:hive/hive.dart';
import 'package:my_dictionary/data/models/word_model.dart';

class WordTypeAdapter extends TypeAdapter<WordModel> {
  @override
  final int typeId = 0;

  @override
  WordModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final Map<int, dynamic> fields = <int, dynamic>{};
    for (int i = 0; i < numOfFields; i++) {
      final fieldId = reader.readByte();
      final value = reader.read();
      fields[fieldId] = value;
    }

    final text = fields[0] as String? ?? '';
    final isArabic = fields[1] as bool? ?? true;
    final colorCode = fields[2] as int? ?? 0XFF4A47A3;
    final arabicSimilarWords =
        (fields[3] as List?)?.cast<String>() ?? <String>[];
    final englishSimilarWords =
        (fields[4] as List?)?.cast<String>() ?? <String>[];
    final arabicExamples = (fields[5] as List?)?.cast<String>() ?? <String>[];
    final englishExamples = (fields[6] as List?)?.cast<String>() ?? <String>[];

    return WordModel(
      text: text,
      isArabic: isArabic,
      colorCode: colorCode,
      arabicSimilarWords: arabicSimilarWords,
      englishSimilarWords: englishSimilarWords,
      arabicExamples: arabicExamples,
      englishExamples: englishExamples,
    );
  }

  @override
  void write(BinaryWriter writer, WordModel obj) {
    writer.writeByte(7);

    writer.writeByte(0);
    writer.write(obj.text);

    writer.writeByte(1);
    writer.write(obj.isArabic);

    writer.writeByte(2);
    writer.write(obj.colorCode);

    writer.writeByte(3);
    writer.write(obj.arabicSimilarWords);

    writer.writeByte(4);
    writer.write(obj.englishSimilarWords);

    writer.writeByte(5);
    writer.write(obj.arabicExamples);

    writer.writeByte(6);
    writer.write(obj.englishExamples);
  }
}
