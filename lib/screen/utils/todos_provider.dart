import 'package:flutter/material.dart';
import 'package:todo_app/modules/todos.dart';
// import 'package:provider/provider.dart';

class TodosProvider2 extends ChangeNotifier {
  List<Todo> _todos = [
    Todo(
      createdTime: DateTime.now(),
      title: "sheep",
      description: "very noooice",
    ),
    Todo(
      createdTime: DateTime.now(),
      title: "sleep",
      description: "very noooice",
    ),
    Todo(
      createdTime: DateTime.now(),
      title: "deeppppp",
      description: "very noooice",
    ),
    Todo(
      createdTime: DateTime.now(),
      title: "poooooooookkkkkkkkkkkkeeee",
      description: "very noooice",
    ),
    Todo(
      createdTime: DateTime.now(),
      title: "wooooooorrrkkkkiiinngggg",
      description: "very noooice",
    ),
  ];
  List<Todo> get todos => _todos;

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }
}
