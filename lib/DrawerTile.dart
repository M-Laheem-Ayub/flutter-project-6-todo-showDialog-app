// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  DrawerTile({
    super.key,
    required this.icon,
    required this.title,
    required this.isDark,
    required this.onTap,
  });
  Function onTap;
  String title;
  IconData icon;
  bool isDark;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? Colors.white12 : Colors.black12,
          borderRadius: BorderRadius.circular(10),
        ),

        height: 50,

        child: ListTile(
          leading: Icon(icon, color: isDark ? Colors.white : Colors.black),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 15,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
          onTap: () {
            onTap();
          },
        ),
      ),
    );
  }
}
