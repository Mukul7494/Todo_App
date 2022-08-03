import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/widget/todo_form_widget.dart';

import '../modules/todos.dart';
import '../screen/utils/todos_provider.dart';

class AddTodoDailogWidget extends ConsumerStatefulWidget {
  const AddTodoDailogWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddTodoDailogWidgetState();
}

class _AddTodoDailogWidgetState extends ConsumerState<AddTodoDailogWidget> {
  final provider1 =
      ChangeNotifierProvider<TodosProvider2>((ref) => TodosProvider2());
  final _formkey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  @override
  Widget build(BuildContext context) => AlertDialog(
        content: Form(
          key: _formkey,
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Add Todo",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TodoFormWidget(
                  onChangedTitle: (title) => setState(() => this.title = title),
                  onChangedDescription: (description) =>
                      setState(() => this.description),
                  onSavedTodo: addTodo,
                )
              ]),
        ),
      );

  void addTodo() {
    final isValid = _formkey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      final todo = Todo(
        id: DateTime.now().toString(),
        title: title,
        description: description,
        createdTime: DateTime.now(),
      );
      // final addTodoProvider = ref.watch(provider1);
      // addTodoProvider.addTodo(todo);
      // Navigator.of(context).pop();

      Consumer(builder: (ctx, WidgetRef ref, child) {
        final addTodoProvider = ref.watch(provider1);
        // final todos = addTodoProvider.addTodo(todo);

        return addTodoProvider.addTodo(todo);
      });
    }
  }
}