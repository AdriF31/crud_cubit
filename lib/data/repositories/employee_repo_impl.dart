import 'dart:async';

import 'package:crud_cubit/const/const_value.dart';
import 'package:crud_cubit/data/repositories/employee_repo.dart';
import 'package:crud_cubit/data/storage.dart';
import 'package:dio/dio.dart';
import 'package:crud_cubit/data/models/delete_employee.dart';
import 'package:crud_cubit/data/models/detail_employee.dart';
import 'package:crud_cubit/data/models/get_employee.dart';
import 'package:crud_cubit/data/models/post_employee.dart';
import 'package:crud_cubit/data/models/put_employee.dart';

class EmployeeRepoImpl implements EmployeeRepo {
  Dio dio = Dio();

  @override
  FutureOr<GetEmployee?> getEmployee() async {
    try {
      var response = await dio.get(baseUrl);
      return GetEmployee.fromJson(response.data);
    } on DioError catch (e) {
      return GetEmployee.fromJson(e.response?.data);
    }
  }

  @override
  FutureOr<DetailEmployee?> getDetailEmployee(String id) async {
    try {
      var response = await dio.get('$baseUrl/$id');
      return DetailEmployee.fromJson(response.data);
    } on DioError catch (e) {
      return DetailEmployee.fromJson(e.response?.data);
    }
  }

  @override
  FutureOr<DeleteEmployee?> deleteEmployee(String id) async {
    try {
      var response = await dio.delete('$baseUrl/$id');
      return DeleteEmployee.fromJson(response.data);
    } on DioError catch (e) {
      return DeleteEmployee.fromJson(e.response?.data);
    }
  }

  @override
  FutureOr<PostEmployee?> postEmployee(
      String name, String nik, String position) async {
    try {
      var response = await dio.post(baseUrl,
          data: {'name': name, 'nik': nik, 'position': position});
      return PostEmployee.fromJson(response.data);
    } on DioError catch (e) {
      return PostEmployee.fromJson(e.response?.data);
    }
  }

  @override
  FutureOr<PutEmployee?> putEmployee(
      String? name, String? nik, String? position, String? id) async {
    try {
      var response = await dio.put('$baseUrl/$id',
          data: {'name': name, 'nik': nik, 'position': position});
      return PutEmployee.fromJson(response.data);
    } on DioError catch (e) {
      return PutEmployee.fromJson(e.response?.data);
    }
  }
}
