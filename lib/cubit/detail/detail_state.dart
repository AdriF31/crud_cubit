part of 'detail_cubit.dart';

@immutable
abstract class DetailState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DetailInitial extends DetailState {}

class DetailStateLoading extends DetailState {}

class DetailStateLoaded extends DetailState {
  DetailEmployee? detailEmployee = DetailEmployee();

  DetailStateLoaded({required this.detailEmployee});

  @override
  List<Object?> get props => [detailEmployee];
}

class DetailStateError extends DetailState {
  final String message;

  DetailStateError({required this.message});

  @override
  List<Object?> get props => [message];
}
