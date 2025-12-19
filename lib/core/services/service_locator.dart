import 'package:get_it/get_it.dart';
import 'package:my_dictionary/controllers/read_data_cubit/read_data_cubit.dart';
import 'package:my_dictionary/controllers/write_data_cubit/write_data_cubit.dart';
import 'package:my_dictionary/core/services/hive_service.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  getIt.registerSingletonAsync<HiveService>(() async {
    final service = HiveService();
    await service.init();
    return service;
  });

  _registerCubits();
}

void _registerCubits() {
  getIt.registerLazySingleton<ReadDataCubit>(() => ReadDataCubit(getIt<HiveService>()));
  getIt.registerLazySingleton<WriteDataCubit>(() => WriteDataCubit(getIt<HiveService>()));
}
