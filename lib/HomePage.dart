// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_6/AddTaskAlertBox.dart';
import 'package:flutter_application_6/DelTaskAlertBox.dart';
import 'package:flutter_application_6/MainPage.dart';
import 'package:flutter_application_6/MyAppBar.dart';
import 'package:flutter_application_6/MyDrawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDark = false;
  bool isaddTaskPopUp = false;
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

  void delTask(int index) {
    setState(() {
      notes.removeAt(index);
    });
  }

  void darkMode() {
    setState(() {
      isDark = !isDark;
    });
  }

  void addTaskPopUp() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(content: AddTaskAlertBox(addNewTask: addNewTask));
      },
    );
  }

  void delTaskPopUp(Function() delTaskCallback) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(content: DelTaskAlertBox(delTask: delTaskCallback));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: isDark ? Color(0xff101218) : Colors.white,
        appBar: MyAppBar(
          isDark: isDark,
          addTaskPopUp: addTaskPopUp,
          darkMode: darkMode,
        ),
        drawer: Drawer(
          width: 280,
          backgroundColor: isDark ? Color(0xff101218) : Colors.white,
          child: MyDrawer(
            isDark: isDark,
            darkMode: darkMode,
            addTaskPopUp: addTaskPopUp,
          ),
        ),
        body: MainPage(
          isDark: isDark,
          notes: notes,
          delTaskPopUp: (int index) {
            delTaskPopUp(() {
              delTask(index); // ✅ Actual delete
            });
          },
        ),
      ),
    );
  }
}
