import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/screen/utils/todos_provider.dart';
// import 'package:riverpod/riverpod.dart';
import 'package:todo_app/widget/todo_widget.dart';

// import 'package:todo_app/widget/todo_widget.dart';
// final provider = Provider((ref) => TodosProvider());
final todoProvider = ChangeNotifierProvider<TodosProvider2>((ref) {
  return TodosProvider2();
});

class TodoListWidget extends ConsumerWidget {
  const TodoListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoProvider);

    return todos.todos.isEmpty
        ? Center(
            child: Text(
              "No Information Available",
              style: TextStyle(fontSize: 25),
            ),
          )
        : ListView.separated(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(10),
            separatorBuilder: (context, index) => Container(
              height: 6,
              color: Color.fromARGB(255, 230, 228, 228),
            ),
            itemCount: todos.todos.length,
            itemBuilder: (BuildContext context, int index) {
              final todo = todos.todos[index];
              return TodoWidget(
                todo: todo,
              );
            },
          );
  }
}
