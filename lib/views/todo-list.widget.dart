import 'package:flutter/material.dart';
import 'package:me_bored/constants.dart';

import '../models/todo.model.dart';
import '../services/service.locator.dart';
import '../services/todolist.service.dart';
import 'custom-app-bar.widget.dart';

class TodoListWidget extends StatefulWidget {
  TodoListWidget({super.key});

  TodoListService todoListService = getIt<TodoListService>();

  @override
  State<StatefulWidget> createState() {
    return _TodoListWidgetState();
  }
}

class _TodoListWidgetState extends State<TodoListWidget> {
  late final List<Todo> todos = widget.todoListService.getList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(false, true, preferredSize: Size(56, 56)),
      backgroundColor: const Color(COLORS.accent),
      body: Column(
        children: [

          const Center(child: Padding(
            padding: EdgeInsets.symmetric(vertical: 50),
            child: Text("My todo activities", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color(COLORS.primary))),
          )),

          Expanded(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: todos.isEmpty
                      ? const Text("No activities yet.")
                      : ListView.builder(
                          itemCount: todos.length,
                          prototypeItem: ListTile(
                            title: Text(todos.first.title),
                          ),
                          itemBuilder: (context, i) => Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4),
                                child: CheckboxListTile(
                                  title: Text(todos[i].title),
                                  value: todos[i].state,
                                  onChanged: (bool? value) => setState(() {
                                    todos[i].state = value! ? value : false;
                                  }),
                                  tileColor: Colors.white,
                                  secondary: Image.asset(todos[i].icon),
                                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                                  checkboxShape: const CircleBorder(),
                                  checkColor: const Color(COLORS.checkColor),
                                  activeColor: const Color(COLORS.accent),
                                ),
                              ))))
        ],
      ),
    );
  }
}
