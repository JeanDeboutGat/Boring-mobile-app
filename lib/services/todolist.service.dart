import '../models/todo.model.dart';

class TodoListService {
  List<Todo> todoList = [];

  void add(Todo todo) {
    todoList.add(todo);
  }

  List<Todo> getList() {
    return todoList;
  }
}
