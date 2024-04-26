import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do/page/home_page.dart';

void main() async {
  // init the hive
  await Hive.initFlutter();
  // Open The Box
  var box = await Hive.openBox('mybox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'To Do',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
