part of 'update_employee_cubit.dart';

@immutable
abstract class UpdateEmployeeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UpdateEmployeeInitial extends UpdateEmployeeState {}

class UpdateEmployeeStateLoading extends UpdateEmployeeState {}

class UpdateEmployeeStateSuccess extends UpdateEmployeeState {
  final String message;

  UpdateEmployeeStateSuccess({required this.message});

  @override
  List<Object?> get props => [message];
}

class UpdateEmployeeStateFailed extends UpdateEmployeeState {
  final String message;

  UpdateEmployeeStateFailed({required this.message});

  @override
  List<Object?> get props => [message];
}
