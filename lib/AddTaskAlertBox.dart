// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';

class AddTaskAlertBox extends StatelessWidget {
  AddTaskAlertBox({super.key, required this.addNewTask});

  Function addNewTask;

  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? isEmpty(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Task cannot be empty";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 300,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close_rounded),
                ),
              ],
            ),
            Text(
              "Add New Task",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: TextFormField(
                controller: _controller,
                validator: isEmpty,
                cursorColor: Colors.black,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  focusColor: Colors.black,
                  hintText: "Task",
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 12,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  addNewTask(_controller.text.trim());
                  Navigator.pop(context);
                }
              },
              child: Text("Ok"),
            ),
          ],
        ),
      ),
    );
  }
}
