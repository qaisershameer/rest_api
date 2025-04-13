import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:rest_api/models/todo_model.dart';
import 'package:rest_api/views/todos/todo_detail_screen.dart';

class ToDoListView extends StatelessWidget {
  const ToDoListView({super.key, this.title, required this.toDos});
  final String? title;
  final List<ToDos> toDos;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: toDos.length,
      itemBuilder: (context, index) {
        /// assign toDoList to single_todo List variable
        final todo = toDos[index];

        // Card
        return Card(
          // Color
          color: todo.completed == true
              ? Colors.green.shade700
              : Colors.red.shade300,

          // ListTile
          child: ListTile(
            /// Navigate to ToDo Detail Screen
            onTap: () => Get.to(() => TodoDetailScreen(todo: todo)),

            // Id
            leading: CircleAvatar(
                backgroundColor: todo.completed == true
                    ? Colors.green.shade900
                    : Colors.red.shade900,
                child: Text(todo.id.toString())),

            // Title
            title: Text('Title: ${todo.title}',
                style: TextStyle(color: Colors.white)),

            // Status
            subtitle: Text(
                'Status: ${todo.completed == true ? 'Completed' : 'Pending'} \nUser Id: 0${todo.userId}',
                style: TextStyle(color: Colors.black87)),

            // Icon
            trailing: todo.completed == true
                ? Icon(Icons.check, color: Colors.white)
                : Icon(Icons.error_outline, color: Colors.amber),
          ),
        );
      },
    );
  }
}
