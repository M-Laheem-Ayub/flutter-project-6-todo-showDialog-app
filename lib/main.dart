import 'package:flutter/material.dart';
import 'package:flutter_application_6/HomePage.dart';

//Drawer
//DrawerHeader
//ListView
//ListTile
//ShowDialog()
//AlertDialog
//Navigator.pop(context);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}
