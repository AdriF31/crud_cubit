import 'package:crud_cubit/data/models/get_employee.dart';
import 'package:hive_flutter/adapters.dart';

class Storage {
  var box = Hive.box('data');

  saveUserEmail(String? email) {
    return box.put('email', email);
  }

  saveEmployee(GetEmployee employee) {
    return box.put('employee', employee);
  }

  getEmployee() {
    return box.get('employee');
  }

  getUserEmail() {
    return box.get('email');
  }

  getLoginState() {
    return box.get('is_login');
  }

  isLogin(bool isLogin) {
    return box.put('is_login', isLogin);
  }
}
