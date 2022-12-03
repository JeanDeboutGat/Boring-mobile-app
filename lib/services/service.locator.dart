import 'package:get_it/get_it.dart';
import 'package:me_bored/services/todolist.service.dart';

final getIt = GetIt.instance;

setupServiceLocator() {
  getIt.registerLazySingleton<TodoListService>(() => TodoListService());
}
