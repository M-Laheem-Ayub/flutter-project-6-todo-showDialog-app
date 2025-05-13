// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_6/MyAlertBox.dart';
import 'package:flutter_application_6/MainPage.dart';
import 'package:flutter_application_6/MyDrawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDark = false;
  bool isPopUp = false;
  List notes = [
    ["Submit Flutter development assignment", false],
    ["Read 10 pages of assigned reading material", false],
    ["Perform daily fitness routine", false],
    ["Watch Flutter/Dart tutorial for skill enhancement", false],
    ["Update and refine professional resume", false],
  ];
  void addNewTask(String task) {
    setState(() {
      notes.add([task, false]);
    });
  }

  void darkMode() {
    setState(() {
      isDark = !isDark;
    });
  }

  void popUp() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(content: MyAlertBox(addNewTask: addNewTask));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: isDark ? Color(0xff101218) : Colors.white,
        appBar: AppBar(
          shadowColor: isDark ? Colors.white : Colors.black,
          backgroundColor: isDark ? Color(0xff101218) : Colors.white,
          leading: Builder(
            builder:
                (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(
                    Icons.menu,
                    color: isDark ? Colors.white : Color(0xff363e45),
                  ),
                ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                popUp();
              },
              icon: Icon(
                Icons.add,
                size: 30,
                color: isDark ? Colors.white : Color(0xff363e45),
              ),
            ),
            IconButton(
              onPressed: () {
                darkMode();
              },
              icon: Icon(
                isDark ? Icons.light_mode : Icons.dark_mode,
                size: 30,
                color: isDark ? Colors.white : Color(0xff363e45),
              ),
            ),
          ],
        ),

        drawer: Drawer(
          width: 280,
          backgroundColor: isDark ? Color(0xff101218) : Colors.white,
          child: MyDrawer(isDark: isDark, darkMode: darkMode, popUp: popUp),
        ),
        body: MainPage(isDark: isDark, notes: notes),
      ),
    );
  }
}
