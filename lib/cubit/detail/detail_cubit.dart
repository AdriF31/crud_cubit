import 'package:bloc/bloc.dart';
import 'package:crud_cubit/data/models/detail_employee.dart';
import 'package:crud_cubit/data/repositories/employee_repo.dart';
import 'package:crud_cubit/data/repositories/employee_repo_impl.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'detail_state.dart';

class DetailCubit extends Cubit<DetailState> {
  EmployeeRepo employeeRepository = EmployeeRepoImpl();

  DetailCubit() : super(DetailInitial());

  void detailRequestEvent(String id) async {
    emit(DetailStateLoading());

    var response = await employeeRepository.getDetailEmployee(id);

    if (response?.status == 200) {
      emit(DetailStateLoaded(detailEmployee: response));
    } else {
      emit(DetailStateError(message: 'something went wrong'));
    }
  }
}
