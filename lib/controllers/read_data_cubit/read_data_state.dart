import 'package:my_dictionary/model/word_model.dart';

abstract class ReadDataState {}

final class ReadDataInitial extends ReadDataState {}

final class ReadDataLoading extends ReadDataState {}

final class ReadDataSuccess extends ReadDataState {
  final List<MapEntry<int, WordModel>> words;

  ReadDataSuccess({required this.words});
}

final class ReadDataFailure extends ReadDataState {
  final String message;

  ReadDataFailure({required this.message});
}
