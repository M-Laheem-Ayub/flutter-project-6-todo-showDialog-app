// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_6/ToDoTile.dart';

class MainPage extends StatefulWidget {
  bool isDark;
  final Function(int) delTaskPopUp;
  List notes;
  MainPage({
    super.key,
    required this.isDark,
    required this.notes,
    required this.delTaskPopUp,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  void _onChange(int index) {
    setState(() {
      widget.notes[index][1] = !widget.notes[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    final notes = widget.notes;
    return Column(
      children: [
        Center(
          child: Text(
            "To Do App ",
            style: TextStyle(
              color: widget.isDark ? Colors.white : Color(0xff363e45),
              fontSize: 58,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 10),

        Expanded(
          child: ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              return ToDoTile(
                key: ValueKey(notes[index][0]),
                delTask: () {
                  widget.delTaskPopUp(index);
                },
                task: notes[index][0],
                tileColor:
                    index % 2 == 0
                        ? widget.isDark
                            ? Colors.grey[350]
                            : Color(0xffb8d9bc)
                        : widget.isDark
                        ? Colors.blueGrey[200]
                        : Color(0xffdbc7d9),
                value: notes[index][1],
                onChange: (newValue) {
                  _onChange(index);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
