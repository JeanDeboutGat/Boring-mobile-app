import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:me_bored/boring_observer.dart';
import 'package:me_bored/services/service.locator.dart';
import 'package:me_bored/views/home.widget.dart';
import 'package:me_bored/views/loading-app.widget.dart';
import 'package:me_bored/views/todo-list.widget.dart';
import 'package:me_bored/views/filter.widget.dart';

import 'cubits/category_cubit.dart';

void main() {
  setupServiceLocator();
  Bloc.observer = BoringObserver();
  runApp(BlocProvider(
    create: (_) => CategoryCubit(),
    child: MaterialApp(initialRoute: '/', routes: {
      '/': (context) => const HomeWidget(),
      '/todolist': (context) => TodoListWidget(),
      '/filter': (context) => FilterWidget(),
      '/loading': ((context) => const LoadingAppWidget())
    }),
  ));
}
