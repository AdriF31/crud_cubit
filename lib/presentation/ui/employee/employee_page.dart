import 'package:crud_cubit/cubit/employee/employee_cubit.dart';
import 'package:crud_cubit/data/storage.dart';
import 'package:crud_cubit/presentation/ui/create/create_employee_page.dart';
import 'package:crud_cubit/presentation/ui/detail/employee_detail.dart';
import 'package:crud_cubit/presentation/ui/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EmployeePage extends StatelessWidget {
  const EmployeePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Storage storage = Storage();
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee'),
        actions: [
          IconButton(onPressed: (){
            storage.isLogin(false);
            Fluttertoast.showToast(msg: 'Berhasil Logout');
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginPage()), (route) => false);
          }, icon: Icon(Icons.logout))
        ],
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CreateEmployeePage()));
          },
          child: Icon(Icons.add)),
      body: BlocBuilder<EmployeeCubit, EmployeeState>(
        builder: (context, state) {
          if (state is EmployeeStateLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is EmployeeStateLoaded) {
            return RefreshIndicator(
              onRefresh: ()async{
                BlocProvider.of<EmployeeCubit>(context)..employeeRequestEvent();
              },
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Selamat datang ${storage.getUserEmail()}',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Column(
                        children: state.employee!.data!
                            .map((e) => Card(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EmployeeDetailPage(
                                                    id: e.id ?? '',
                                                  )));
                                    },
                                    child: ListTile(
                                      title: Text(e.name ?? ''),
                                      subtitle: Text(e.nik ?? ''),
                                      trailing: Text(e.position ?? ''),
                                      leading: Text(e.id ?? ''),
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}