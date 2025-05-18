// ignore_for_file: must_be_immutable, file_names, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class DelTaskAlertBox extends StatelessWidget {
  final VoidCallback delTask;

  DelTaskAlertBox({super.key, required this.delTask});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 300,
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
            "Are you sure you want to delete?",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              delTask(); // ✅ call it here
              Navigator.pop(context);
            },
            child: Text("Ok"),
          ),
        ],
      ),
    );
  }
}
