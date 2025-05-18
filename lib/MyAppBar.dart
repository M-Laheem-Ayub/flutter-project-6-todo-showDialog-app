// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  MyAppBar({
    super.key,
    required this.isDark,
    required this.addTaskPopUp,
    required this.darkMode,
  });
  Function addTaskPopUp, darkMode;
  bool isDark;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
            addTaskPopUp();
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
    );
  }
}
