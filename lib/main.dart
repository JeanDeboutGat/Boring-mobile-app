import 'package:flutter/material.dart';
import 'package:me_bored/views/HomeWidget.dart';
import 'package:me_bored/views/LoadingAppWidget.dart';
import 'package:me_bored/views/TodoListWidget.dart';
import 'package:me_bored/views/filterWidget.dart';


void main() {
  runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeWidget(),
        '/todolist': (context) => TodoListWidget(),
        '/filter': (context) => FilterWidget(),
        '/loading': ((context) => const LoadingAppWidget())
      }));
}
