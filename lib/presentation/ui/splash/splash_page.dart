import 'dart:async';

import 'package:crud_cubit/data/storage.dart';
import 'package:crud_cubit/presentation/ui/employee/employee_page.dart';
import 'package:crud_cubit/presentation/ui/login/login_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Storage storage = Storage();

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      if (storage.getLoginState() == true) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => EmployeePage()),
            (route) => false);
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
            (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: Text('Ini Splashscreen'),
      ),
    );
  }
}
