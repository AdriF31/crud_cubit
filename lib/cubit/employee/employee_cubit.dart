import 'package:bloc/bloc.dart';
import 'package:crud_cubit/data/models/get_employee.dart';
import 'package:crud_cubit/data/repositories/employee_repo.dart';
import 'package:crud_cubit/data/repositories/employee_repo_impl.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'employee_state.dart';

class EmployeeCubit extends Cubit<EmployeeState> {
  EmployeeRepoImpl employeeRepo = EmployeeRepoImpl();

  EmployeeCubit() : super(EmployeeInitial());

  void employeeRequestEvent() async {
    emit(EmployeeStateLoading());
    var response = await employeeRepo.getEmployee();
    if (response?.message == 200) {
      emit(EmployeeStateLoaded(employee: response));
    } else {
      emit(EmployeeStateError(message: 'something went wrong'));
    }
  }
}
