import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:time_saver/features/home/data_model.dart';
import 'package:time_saver/features/home/home_screen.dart';
import 'package:time_saver/features/home/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(DataModelAdapter());
  await Hive.openBox<DataModel>("timeBox");

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> TimeProvider()..startTimer(context),
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
