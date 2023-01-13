import 'package:bloc/bloc.dart';
import 'package:crud_cubit/data/repositories/employee_repo.dart';
import 'package:crud_cubit/data/repositories/employee_repo_impl.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'create_employee_state.dart';

class CreateEmployeeCubit extends Cubit<CreateEmployeeState> {
  EmployeeRepo employeeRepo = EmployeeRepoImpl();

  CreateEmployeeCubit() : super(CreateEmployeeInitial());

  void createEmployeeRequestEvent(
      String name, String nik, String position) async {
    emit(CreateEmployeeStateLoading());
    var response = await employeeRepo.postEmployee(name, nik, position);

    if (response?.status == 200) {
      emit(CreateEmployeeStateSuccess(message: response?.message ?? ''));
    } else {
      emit(CreateEmployeeStateFailed(message: 'something went wrong'));
    }
  }
}
