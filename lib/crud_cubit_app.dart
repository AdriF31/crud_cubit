import 'package:crud_cubit/cubit/create/create_employee_cubit.dart';
import 'package:crud_cubit/cubit/delete/delete_employee_cubit.dart';
import 'package:crud_cubit/cubit/employee/employee_cubit.dart';
import 'package:crud_cubit/cubit/login/login_cubit.dart';
import 'package:crud_cubit/cubit/update/update_employee_cubit.dart';
import 'package:crud_cubit/presentation/ui/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CrudCubitApp extends StatelessWidget {
  const CrudCubitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => EmployeeCubit()..employeeRequestEvent()),
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => CreateEmployeeCubit()),
        BlocProvider(create: (context) => UpdateEmployeeCubit()),
        BlocProvider(create: (context) => DeleteEmployeeCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashPage(),
      ),
    );
  }
}
