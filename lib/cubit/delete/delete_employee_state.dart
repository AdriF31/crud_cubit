part of 'delete_employee_cubit.dart';

@immutable
abstract class DeleteEmployeeState extends Equatable{
  @override
  List<Object?> get props => [];
}

class DeleteEmployeeInitial extends DeleteEmployeeState {}

class DeleteEmployeeStateLoading extends DeleteEmployeeState{}

class DeleteEmployeeStateSuccess extends DeleteEmployeeState{
  final String message;
  DeleteEmployeeStateSuccess({required this.message});
  @override
  List<Object?> get props => [message];
}
class DeleteEmployeeStateFailed extends DeleteEmployeeState{
  final String message;
  DeleteEmployeeStateFailed({required this.message});
  @override
  List<Object?> get props => [message];
}
