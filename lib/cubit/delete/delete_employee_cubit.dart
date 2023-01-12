import 'package:bloc/bloc.dart';
import 'package:crud_cubit/data/repositories/employee_repo_impl.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'delete_employee_state.dart';

class DeleteEmployeeCubit extends Cubit<DeleteEmployeeState> {
  EmployeeRepoImpl employeeRepo = EmployeeRepoImpl();

  DeleteEmployeeCubit() : super(DeleteEmployeeInitial());

  void deleteEmployeeRequestEvent(String id) async {
    emit(DeleteEmployeeStateLoading());
    var response = await employeeRepo.deleteEmployee(id);
    if (response?.status == 200) {
      emit(DeleteEmployeeStateSuccess(message: response?.message ?? ''));
    } else {
      emit(DeleteEmployeeStateFailed(message: 'something went wrong'));
    }
  }
}
