// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:todo_app/screen/utils/todos_provider.dart';
// import 'package:todo_app/modules/todos.dart';
// import 'package:todo_app/widget/todo_form_widget.dart';

// class AddTodoDailog extends StatefulWidget {
//   const AddTodoDailog({Key? key}) : super(key: key);

//   @override
//   State<AddTodoDailog> createState() => _AddTodoDailogState();
// }

// class _AddTodoDailogState extends State<AddTodoDailog> {
//   final provider1 =
//       ChangeNotifierProvider<TodosProvider2>((ref) => TodosProvider2());
//   final _formkey = GlobalKey<FormState>();
//   String title = '';
//   String description = '';
//   @override
//   Widget build(BuildContext context) => AlertDialog(
//         content: Form(
//           key: _formkey,
//           child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   "Add Todo",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 22,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 8,
//                 ),
//                 TodoFormWidget(
//                   onChangedTitle: (title) => setState(() => this.title = title),
//                   onChangedDescription: (description) =>
//                       setState(() => this.description),
//                   onSavedTodo: addTodo,
//                 )
//               ]),
//         ),
//       );

//   void addTodo() {
//     final isValid = _formkey.currentState!.validate();
//     if (!isValid) {
//       return;
//     } else {
//       final todo = Todo(
//         id: DateTime.now().toString(),
//         title: title,
//         description: description,
//         createdTime: DateTime.now(),
//       );
//       Consumer(builder: (ctx, WidgetRef ref, child) {
//         final addTodoProvider = ref.watch(provider1);
//         // final todos = addTodoProvider.addTodo(todo);

//         return addTodoProvider.addTodo(todo);
//       });
//     }
//   }
// }
