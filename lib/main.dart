import 'dart:io';

import 'package:crud_cubit/crud_cubit_app.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

void main() async{
 WidgetsFlutterBinding.ensureInitialized();
 Directory directory = await pathProvider.getApplicationDocumentsDirectory();
 await Hive.initFlutter(directory.path);
 await Hive.openBox('data');
  runApp(const CrudCubitApp());
}


