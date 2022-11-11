import 'package:flutter/material.dart';
import 'package:me_bored/TodoListWidget.dart';

import 'HomeWidget.dart';
import 'LoadingAppWidget.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/todolist',
    routes: {
      '/': (context) =>  TodoListWidget(),
      '/home': (context) => HomeWidget(),
    '/todolist': (context)=> TodoListWidget()},
  ));
}
