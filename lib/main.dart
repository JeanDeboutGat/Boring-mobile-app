import 'package:flutter/material.dart';
import 'package:me_bored/TodoListWidget.dart';
import 'package:me_bored/filterWidget.dart';

import 'HomeWidget.dart';
import 'LoadingAppWidget.dart';

void main() {
  runApp(MaterialApp(
      initialRoute: '/filter',
      routes: {
        '/': (context) => FilterWidget(),
        '/home': (context) => HomeWidget(),
        '/todolist': (context) => TodoListWidget(),
        '/filter': (context) => FilterWidget(),
      }));
}
