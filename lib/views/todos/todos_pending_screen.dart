import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:rest_api/controllers/todos_controller.dart';

import '../../custom_widgets/todo_list_view.dart';

class TodosPendingScreen extends StatelessWidget {
  TodosPendingScreen({super.key});
  final controller = Get.find<ToDosController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      ///-----[AppBar]-----
        appBar: AppBar(
          title: Text('Pending ToDo',
              style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.red.shade900,
          centerTitle: true,
        ),

        ///-----[Body]-----
        body: controller.pendingToDo.isEmpty

        /// Show Indicator if allTodo is Empty
            ? Center(child: CircularProgressIndicator())

        /// Show ToDos Data Obx widget using Controller
            : ToDoListView(title: 'Pending ToDo', toDos: controller.pendingToDo),
    );
  }
}
