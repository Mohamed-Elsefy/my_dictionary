import 'package:equatable/equatable.dart';

abstract class WriteDataState extends Equatable {
  const WriteDataState();

  @override
  List<Object?> get props => [];
}

class WriteDataInitial extends WriteDataState {}

class WriteDataLoading extends WriteDataState {}

class WriteDataSuccess extends WriteDataState {}

class WriteDataFailure extends WriteDataState {
  final String message;
  const WriteDataFailure(this.message);

  @override
  List<Object?> get props => [message];
}
