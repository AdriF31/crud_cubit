import 'package:hive_flutter/adapters.dart';

class Storage {
  var box = Hive.box('data');

  saveUserEmail(String? email) {
    return box.put('email', email);
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
