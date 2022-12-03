import 'package:flutter/material.dart';
import 'package:me_bored/services/service.locator.dart';
import 'package:me_bored/views/home.widget.dart';
import 'package:me_bored/views/loading-app.widget.dart';
import 'package:me_bored/views/todo-list.widget.dart';
import 'package:me_bored/views/filter.widget.dart';


void main() {
  setupServiceLocator();
  runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeWidget(),
        '/todolist': (context) => TodoListWidget(),
        '/filter': (context) => FilterWidget(),
        '/loading': ((context) => const LoadingAppWidget())
      }));
}
