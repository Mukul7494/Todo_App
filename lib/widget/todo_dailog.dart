import 'package:flutter/material.dart';
import 'package:todo_app/widget/todo_form_widget.dart';

class AddTodoDailog extends StatefulWidget {
  const AddTodoDailog({Key? key}) : super(key: key);

  @override
  State<AddTodoDailog> createState() => _AddTodoDailogState();
}

class _AddTodoDailogState extends State<AddTodoDailog> {
  final _formkey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  @override
  Widget build(BuildContext context) => AlertDialog(
        content: Column(
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
                onSavedTodo: () {},
              )
            ]),
      );
}
