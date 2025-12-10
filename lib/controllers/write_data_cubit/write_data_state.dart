class WriteDataState {}

final class WriteDataInitial extends WriteDataState {}

final class WriteDataLoading extends WriteDataState {}

final class WriteDataSuccess extends WriteDataState {}

final class WriteDataFailure extends WriteDataState {
  final String message;

  WriteDataFailure({required this.message});
}

final class UpdateColorState extends WriteDataState {}

final class UpdateIsArabicState extends WriteDataState {}

final class UpdateTextState extends WriteDataState {}
