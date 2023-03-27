import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app_using_hive/pages/homepage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  ///initialize the hive
  await Hive.initFlutter();
  ///open a box
  await Hive.openBox("mybox");
  //var box=await Hive.openBox("mybox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).copyWith(
        colorScheme: Theme.of(context).colorScheme.copyWith(
          primary: const Color(0xFF5F52EE),
        ),
      ),
      home: const HomePage(),
    );
  }
}
