import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar(this.filter, this.todoList, {super.key, required this.preferredSize});

  final bool filter;
  final bool todoList;

  @override
  State<StatefulWidget> createState() {
    return _CustomAppBarState();
  }

  @override
  final Size preferredSize; // default is 56.0
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff583823),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/app-logo.png",
              fit: BoxFit.scaleDown,
              width: 55,
            ),
            Text("Boring")
          ],
        ),
        actions: [
          widget.todoList
              ? IconButton(
                  icon: const Icon(Icons.filter_alt_outlined),
                  tooltip: "Open activities filter",
                  onPressed: () {
                    Navigator.pushNamed(context, '/filter');
                    print("todo list pressed");
                  },
                )
              : Container(),
          widget.filter
              ? IconButton(
                  icon: const Icon(Icons.checklist_rtl_outlined),
                  tooltip: "Open activities filter",
                  onPressed: () {
                    Navigator.pushNamed(context, '/todolist');
                    print("filter pressed");
                  },
                )
              : Container(),
        ]);
  }
}
