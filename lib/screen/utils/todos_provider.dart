import 'package:flutter/material.dart';
import 'package:todo_app/modules/todos.dart';

class TodosProvider2 extends ChangeNotifier {
  List<Todo> _todos = [
    Todo(
        createdTime: DateTime.now(),
        title: "sheep",
        description: "very noooice",
        id: "1"),
    Todo(
        createdTime: DateTime.now(),
        title: "sleep",
        description: "very noooice",
        id: "1"),
    Todo(
        createdTime: DateTime.now(),
        title: "deeppppp",
        description: "very noooice",
        id: "1"),
    Todo(
        createdTime: DateTime.now(),
        title: "poooooooookkkkkkkkkkkkeeee",
        description: "very noooice",
        id: "1"),
    Todo(
        createdTime: DateTime.now(),
        title: "wooooooorrrkkkkiiinngggg",
        description: "very noooice",
        id: "1"),
  ];
  List<Todo> get todo => _todos;

  addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }
}
