import 'package:flutter/material.dart';
import 'package:rest_api/models/todo_model.dart';

import '../../custom_widgets/todo_list_view.dart';

class TodosUserWiseScreen extends StatelessWidget {
  const TodosUserWiseScreen({super.key, this.title, required this.todos});
  final String? title;
  final List<ToDos> todos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///-----[AppBar]-----
      appBar: AppBar(
        title: Text('User Wise All ToDo',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal.shade800,
        centerTitle: true,
      ),

      ///-----[Body]-----
      body: todos.isEmpty

      /// Show Indicator if allTodo is Empty
          ? Center(child: CircularProgressIndicator())

      /// Show ToDos Data Obx widget using Controller
          : ToDoListView(title: 'All ToDo', toDos: todos.toList()),
    );
  }
}
