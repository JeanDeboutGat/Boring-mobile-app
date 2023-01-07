import 'package:get_it/get_it.dart';
import 'package:me_bored/services/filter.service.dart';
import 'package:me_bored/services/todolist.service.dart';

final getIt = GetIt.instance;

/// This function use a service locator pattern to locate services in our application
/// It will help us to manage the dependencies of our application,
///so that objects can be passed the dependencies they need through their constructors
setupServiceLocator() {
  getIt.registerLazySingleton<TodoListService>(() => TodoListService());
  getIt.registerLazySingleton<FilterService>(() => FilterService());
}
