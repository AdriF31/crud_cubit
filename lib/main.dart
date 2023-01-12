import 'package:crud_cubit/crud_cubit_app.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
 WidgetsFlutterBinding.ensureInitialized();
 await Hive.initFlutter();
 await Hive.openBox('data');
  runApp(const CrudCubitApp());
}


