import 'package:equatable/equatable.dart';
import 'package:my_dictionary/data/models/word_model.dart';

abstract class ReadDataState extends Equatable {
  const ReadDataState();

  @override
  List<Object?> get props => [];
}

class ReadDataInitial extends ReadDataState {}

class ReadDataLoading extends ReadDataState {}

class ReadDataSuccess extends ReadDataState {
  final List<MapEntry<int, WordModel>> words;

  const ReadDataSuccess(this.words);

  @override
  List<Object?> get props => [words];
}

class ReadDataFailure extends ReadDataState {
  final String message;

  const ReadDataFailure(this.message);

  @override
  List<Object?> get props => [message];
}
