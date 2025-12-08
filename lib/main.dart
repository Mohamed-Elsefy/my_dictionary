import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_dictionary/constants/hive_keys.dart';
import 'package:my_dictionary/model/word_model.dart';
import 'package:my_dictionary/model/word_type_adapter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(WordTypeAdapter());
  await Hive.openBox<WordModel>(HiveKeys.wordsBox);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: Text('Hello World!'))),
    );
  }
}
