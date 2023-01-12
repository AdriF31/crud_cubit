part of 'create_employee_cubit.dart';

@immutable
abstract class CreateEmployeeState extends Equatable{
  @override
  List<Object?> get props => [];
}

class CreateEmployeeInitial extends CreateEmployeeState {}

class CreateEmployeeStateLoading extends CreateEmployeeState{}
class CreateEmployeeStateSuccess extends CreateEmployeeState{
  final String message;
  CreateEmployeeStateSuccess({required this.message});
  @override
  List<Object?> get props => [message];
}
class CreateEmployeeStateFailed extends CreateEmployeeState{
  final String message;
  CreateEmployeeStateFailed({required this.message});
  @override
  List<Object?> get props => [message];
}


