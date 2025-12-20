import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_dictionary/core/constants/app_strings.dart';
import 'package:my_dictionary/core/services/service_locator.dart';
import 'package:my_dictionary/core/themes/app_theme.dart';
import 'package:my_dictionary/controllers/read_data_cubit/read_data_cubit.dart';
import 'package:my_dictionary/controllers/write_data_cubit/write_data_cubit.dart';
import 'package:my_dictionary/data/hive_adapter/word_type_adapter.dart';
import 'package:my_dictionary/data/hive_keys.dart';
import 'package:my_dictionary/data/models/word_model.dart';
import 'package:my_dictionary/view/screens/home_screen/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _initHive();

  await setupServiceLocator();
  await getIt.allReady();

  runApp(const MyDictionaryApp());
}

Future<void> _initHive() async {
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(WordTypeAdapter());
  }

  await Hive.openBox<WordModel>(HiveKeys.wordsBox);
}

class MyDictionaryApp extends StatelessWidget {
  const MyDictionaryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ReadDataCubit>(
          create: (_) => getIt<ReadDataCubit>()..loadWords(),
        ),
        BlocProvider<WriteDataCubit>(create: (_) => getIt<WriteDataCubit>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        title: AppStrings.myDictionary,
        home: const HomeScreen(),
      ),
    );
  }
}
