// ignore_for_file: must_be_immutable, file_names
import 'package:flutter/material.dart';
import 'package:flutter_application_6/DrawerTile.dart';

class MyDrawer extends StatefulWidget {
  MyDrawer({
    super.key,
    required this.isDark,
    required this.darkMode,
    required this.popUp,
  });
  bool isDark;
  Function darkMode, popUp;
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  _MyDrawerState();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            height: 220,
            decoration: BoxDecoration(
              color: widget.isDark ? Colors.white12 : Colors.black12,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                SizedBox(height: 15),
                CircleAvatar(
                  radius: 60,
                  child: Image.asset("assets/images/profile-img.png"),
                ),
                SizedBox(height: 20),
                Text(
                  "Laheem Ayub",
                  style: TextStyle(
                    fontSize: 15,
                    color: widget.isDark ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(height: 10),

                Text(
                  "Laheem.ayub.dev@gmail.com",
                  style: TextStyle(
                    fontSize: 15,
                    color: widget.isDark ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
        DrawerTile(
          icon:
              widget.isDark
                  ? Icons.light_mode_rounded
                  : Icons.dark_mode_rounded,
          title: widget.isDark ? "Light Mode" : "Dark Mode",
          isDark: widget.isDark,
          onTap: () {
            widget.darkMode();
          },
        ),

        DrawerTile(
          icon: Icons.add,
          title: "Add New Task",
          isDark: widget.isDark,
          onTap: () {
            Navigator.pop(context);
            widget.popUp();
          },
        ),
        DrawerTile(
          icon: Icons.settings,
          title: "Setting",
          isDark: widget.isDark,
          onTap: () {
            Navigator.pop(context);
          },
        ),
        DrawerTile(
          icon: Icons.menu_book_rounded,
          title: "About",
          isDark: widget.isDark,
          onTap: () {
            Navigator.pop(context);
          },
        ),
        DrawerTile(
          icon: Icons.lock_open_rounded,
          title: "Logout",
          isDark: widget.isDark,
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
