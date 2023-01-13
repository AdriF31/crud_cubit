import 'package:bloc/bloc.dart';
import 'package:crud_cubit/data/repositories/employee_repo.dart';
import 'package:crud_cubit/data/repositories/employee_repo_impl.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'update_employee_state.dart';

class UpdateEmployeeCubit extends Cubit<UpdateEmployeeState> {
  EmployeeRepo employeeRepo = EmployeeRepoImpl();

  UpdateEmployeeCubit() : super(UpdateEmployeeInitial());

  void updateEmployeeRequestEvent(
      String name, String nik, String position, String id) async {
    emit(UpdateEmployeeStateLoading());
    var response = await employeeRepo.putEmployee(name, nik, position, id);

    if (response?.name == 200) {
      emit(UpdateEmployeeStateSuccess(message: response?.message ?? ''));
    } else {
      emit(UpdateEmployeeStateFailed(message: 'something went wrong'));
    }
  }
}
