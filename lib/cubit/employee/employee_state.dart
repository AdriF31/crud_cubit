part of 'employee_cubit.dart';

@immutable
abstract class EmployeeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class EmployeeInitial extends EmployeeState {}

class EmployeeStateLoading extends EmployeeState {}

class EmployeeStateLoaded extends EmployeeState {
  GetEmployee? employee = GetEmployee();

  EmployeeStateLoaded({required this.employee});

  @override
  List<Object?> get props => [employee];
}

class EmployeeStateError extends EmployeeState {
  final String message;

  EmployeeStateError({required this.message});

  @override
  List<Object?> get props => [message];
}
