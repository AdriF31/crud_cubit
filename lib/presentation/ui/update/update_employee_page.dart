import 'package:crud_cubit/cubit/update/update_employee_cubit.dart';
import 'package:crud_cubit/presentation/ui/employee/employee_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UpdateEmployeePage extends StatelessWidget {
  final String id;
  final String name;
  final String nik;
  final String position;

  const UpdateEmployeePage(
      {Key? key,
      required this.id,
      required this.name,
      required this.nik,
      required this.position})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nikController = TextEditingController(text: nik);
    TextEditingController nameController = TextEditingController(text: name);
    TextEditingController positionController =
        TextEditingController(text: position);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Employee'),
      ),
      body: BlocConsumer<UpdateEmployeeCubit, UpdateEmployeeState>(
        listener: (context, state) {
          if (state is UpdateEmployeeStateSuccess) {
            Fluttertoast.showToast(msg: state.message);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const EmployeePage()),
                (route) => false);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
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
                          prefixIcon: const Icon(
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
                    const Text(
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
                          prefixIcon: const Icon(
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
                    const Text(
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
                          prefixIcon: const Icon(
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
                        // controller.createEmployee();
                        BlocProvider.of<UpdateEmployeeCubit>(context)
                            .updateEmployeeRequestEvent(
                                nameController.text,
                                nikController.text,
                                positionController.text,
                                id);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child:Center(
                          child: state is UpdateEmployeeStateLoading?Center(child: CircularProgressIndicator(color:Colors.white60),):Text(
                            'Ubah Data',
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
