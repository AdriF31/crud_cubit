import 'package:crud_cubit/cubit/delete/delete_employee_cubit.dart';
import 'package:crud_cubit/cubit/detail/detail_cubit.dart';
import 'package:crud_cubit/presentation/ui/employee/employee_page.dart';
import 'package:crud_cubit/presentation/ui/update/update_employee_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EmployeeDetailPage extends StatelessWidget {
  String id;
  String name;
  String nik;
  String position;

  EmployeeDetailPage(
      {Key? key,
      required this.id,
      required this.name,
      required this.nik,
      required this.position})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailCubit()..detailRequestEvent(id),
      child: BlocListener<DeleteEmployeeCubit, DeleteEmployeeState>(
        listener: (context, state) {
          if (state is DeleteEmployeeStateSuccess) {
            Fluttertoast.showToast(msg: state.message);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => EmployeePage()),
                (route) => false);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text('Detail'),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UpdateEmployeePage(
                                  id: id,
                                  nik: nik,
                                  name: name,
                                  position: position,
                                )));
                  },
                  icon: Icon(Icons.edit)),
              IconButton(
                  onPressed: () {
                    BlocProvider.of<DeleteEmployeeCubit>(context)
                      ..deleteEmployeeRequestEvent(id);
                  },
                  icon: Icon(Icons.delete)),
            ],
          ),
          body:
              BlocBuilder<DetailCubit, DetailState>(builder: (context, state) {
            if (state is DetailStateLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is DetailStateLoaded) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        state.detailEmployee?.data?.name ?? '',
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        state.detailEmployee?.data?.nik ?? '',
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        state.detailEmployee?.data?.position ?? '',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              );
            }

            return SizedBox.shrink();
          }),
        ),
      ),
    );
  }
}
