import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:rest_api/controllers/todos_controller.dart';
import 'package:rest_api/models/todo_model.dart';

class TodoDetailScreen extends StatelessWidget {
  const TodoDetailScreen({super.key, required this.todo});
  final ToDos todo;
  @override
  Widget build(BuildContext context) {
    Get.find<ToDosController>();
    return Scaffold(
      ///-----[ AppBar ]-----
      appBar: AppBar(
        title: Text('ToDo Details'),
        centerTitle: true,
      ),

      ///-----[ Body ]-----
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ///-----[Icon Image]-----
            if (todo.completed)
              Icon(Icons.check, color: Colors.green, size: 200),
            if (todo.completed == false)
              Icon(Icons.error_outline, color: Colors.amber, size: 200),

            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Divider(),
            ),

            ///-----[Title]-----
            Text(
              todo.title.toUpperCase(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold),
            ),

            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Divider(),
            ),

            ///-----[Status-UserId]-----
            Text(
              'Todo ID : ${todo.id}\n\nUser ID : 0${todo.userId}\n\nStatus : ${todo.completed == true ? 'Completed' : 'Pending'}',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.error,
                  fontWeight: FontWeight.bold),
            ),

            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Divider(),
            ),

          ],
        ),
      ),
    );
  }
}
