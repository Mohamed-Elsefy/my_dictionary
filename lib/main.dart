import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_dictionary/controllers/read_data_cubit/read_data_cubit.dart';
import 'package:my_dictionary/controllers/write_data_cubit/write_data_cubit.dart';
import 'package:my_dictionary/core/constants/hive_keys.dart';
import 'package:my_dictionary/core/themes/app_theme.dart';
import 'package:my_dictionary/model/word_model.dart';
import 'package:my_dictionary/model/word_type_adapter.dart';
import 'package:my_dictionary/view/screens/home_screen.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ReadDataCubit()..getWords()),
        BlocProvider(create: (context) => WriteDataCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme(),
        home: const HomeScreen(),
      ),
    );
  }
}
