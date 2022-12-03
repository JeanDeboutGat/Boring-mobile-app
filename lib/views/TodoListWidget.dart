import 'package:flutter/material.dart';
import 'package:me_bored/constants.dart';

import '../models/todo.dart';
import 'CustomAppBarWidget.dart';

class TodoListWidget extends StatefulWidget {
  TodoListWidget({super.key});

  final List<Todo> todos = List<Todo>.generate(50, (i) => Todo("activity ${i}", "assets/cooking.png", false));

  @override
  State<StatefulWidget> createState() {
    return _TodoListWidgetState();
  }
}

class _TodoListWidgetState extends State<TodoListWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(false, true, preferredSize: Size(56, 56)),
      backgroundColor: const Color(COLORS.accent),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 45),
            child: Text("My todo activities", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color(COLORS.primary))),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView.builder(
                itemCount: widget.todos.length,
                prototypeItem: ListTile(
                  title: Text(widget.todos.first.title),
                ),
                itemBuilder: (context, i) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: CheckboxListTile(
                        title: Text(widget.todos[i].title),
                        value: widget.todos[i].state,
                        onChanged: (bool? value) => setState(() {
                          widget.todos[i].state = value! ? value : false;
                        }),
                        tileColor: Colors.white,
                        secondary: Image.asset(widget.todos[i].icon),
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                        checkboxShape: const CircleBorder(),
                        checkColor: const Color(COLORS.checkColor),
                        activeColor: const Color(COLORS.accent),
                      ),
                    )),
          ))
        ],
      ),
    );
  }
}