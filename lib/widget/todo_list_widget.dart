import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:riverpod/riverpod.dart';
import 'package:todo_app/modules/todos.dart';
import 'package:todo_app/widget/todo_widget.dart';

// import 'package:todo_app/widget/todo_widget.dart';
// final provider = Provider((ref) => TodosProvider());
final todoProvider = ChangeNotifierProvider<TodosProvider>((ref) {
  return TodosProvider();
});

class TodoListWidget extends ConsumerWidget {
  // const TodoListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoProvider);

    return ListView.builder(
      itemCount: todos.todo.length,
      itemBuilder: (BuildContext context, int index) {
        final todo = todos.todo[index];
        return TodoWidget(
          todo: todo,
        );
      },
    );
  }
}
