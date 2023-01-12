import 'package:crud_cubit/cubit/create/create_employee_cubit.dart';
import 'package:crud_cubit/presentation/ui/employee/employee_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CreateEmployeePage extends StatelessWidget {
  const CreateEmployeePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nikController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController positionController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Data'),
      ),
      body: BlocConsumer<CreateEmployeeCubit, CreateEmployeeState>(
        listener: (context, state) {
          if (state is CreateEmployeeStateSuccess) {
            Fluttertoast.showToast(msg: state.message);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => EmployeePage()),
                (route) => false);

          }
          if (state is CreateEmployeeStateFailed) {
            Fluttertoast.showToast(msg: state.message);
          }
        },
        builder: (context, state) {
          return state is CreateEmployeeStateLoading?Center(child: CircularProgressIndicator(),): Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'NIK',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextField(
                      controller: nikController,
                      enabled: true,
                      decoration: InputDecoration(
                          focusColor: Colors.green,
                          hintText: '321213231332131',
                          prefixIcon: Icon(
                            Icons.credit_card,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14)),
                          contentPadding: const EdgeInsets.all(12)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nama',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextField(
                      controller: nameController,
                      enabled: true,
                      decoration: InputDecoration(
                          focusColor: Colors.green,
                          hintText: 'john',
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14)),
                          contentPadding: const EdgeInsets.all(12)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Position',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextField(
                      controller: positionController,
                      enabled: true,
                      decoration: InputDecoration(
                          focusColor: Colors.green,
                          hintText: 'manager',
                          prefixIcon: Icon(
                            Icons.credit_card,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14)),
                          contentPadding: const EdgeInsets.all(12)),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<CreateEmployeeCubit>(context).createEmployeeRequestEvent(nameController.text, nikController.text, positionController.text);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Text(
                            'Tambah Data',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
