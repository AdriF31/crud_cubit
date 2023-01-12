
import 'dart:async';

import 'package:crud_cubit/data/models/delete_employee.dart';
import 'package:crud_cubit/data/models/detail_employee.dart';
import 'package:crud_cubit/data/models/get_employee.dart';
import 'package:crud_cubit/data/models/post_employee.dart';
import 'package:crud_cubit/data/models/put_employee.dart';

abstract class EmployeeRepo {
  FutureOr<GetEmployee?> getEmployee();

  FutureOr<PostEmployee?> postEmployee(
      String name, String nik, String position);

  FutureOr<PutEmployee?> putEmployee(String? name, String? nik, String? position, String? id);

  FutureOr<DetailEmployee?> getDetailEmployee(String id);

  FutureOr<DeleteEmployee?> deleteEmployee(String id);
}
