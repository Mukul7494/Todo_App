// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:riverpod/riverpod.dart';

class TodosProvider extends ChangeNotifier {}

class Todo {
  late DateTime createdTime;
  late String title;
  late String id;
  late String description;
  Todo({
    required this.createdTime,
    required this.title,
    required this.description,
    required this.id,
  });
}
