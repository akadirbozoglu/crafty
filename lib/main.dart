import 'package:flutter/material.dart';
import 'database.dart';
import 'login.dart';
import 'package:flutter/widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseCreator().initDatabase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crafty Home',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: Login(),
    );
  }
}
