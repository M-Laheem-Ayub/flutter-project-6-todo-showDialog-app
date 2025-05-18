// ignore_for_file: prefer_const_constructors_in_immutables, file_names, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatefulWidget {
  final String task;
  final Color? tileColor;
  final Function delTask;
  final bool value;
  final ValueChanged<bool?> onChange; // ✅ Fixed Type

  ToDoTile({
    super.key,
    required this.task,
    required this.tileColor,
    required this.value,
    required this.onChange,
    required this.delTask,
  });

  @override
  State<ToDoTile> createState() => _ToDoTileState();
}

class _ToDoTileState extends State<ToDoTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  height: 65,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    onPressed: () {
                      widget.delTask();
                    },
                    icon: Icon(Icons.delete, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
        child: Container(
          height: 65,
          decoration: BoxDecoration(
            color: widget.tileColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Checkbox(
                activeColor: Colors.black,
                value: widget.value,
                onChanged: widget.onChange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: Text(
                    widget.task,
                    style: TextStyle(
                      color: Colors.black,
                      decoration:
                          widget.value
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
