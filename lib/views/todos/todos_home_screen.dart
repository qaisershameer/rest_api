import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:rest_api/views/todos/todos_all_screen.dart';
import 'package:rest_api/views/todos/todos_completed_screen.dart';
import 'package:rest_api/views/todos/todos_pending_screen.dart';
import 'package:rest_api/views/todos/todos_users_screen.dart';

import '../../controllers/todos_controller.dart';
import '../../custom_widgets/u_button_icon.dart';

class ToDosHomeScreen extends StatelessWidget {
  ToDosHomeScreen({super.key});
  final controller = Get.find<ToDosController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade400,
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue, Colors.deepPurple.shade800],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// Gap
              SizedBox(height: 24.0),

              /// Navigate to All todos Screen
              UButtonIcon(
                  myOnPressed: () => Get.to(TodosAllScreen()),
                  buttonText: 'All ToDos List',
                  buttonIcon: Icon(
                    Icons.alarm_add,
                    color: Colors.white,
                  )),

              /// Line Divider 01
              Padding(
                padding: EdgeInsets.all(24.0),
                child:
                    Divider(color: Colors.deepPurple.shade200, thickness: 2.0),
              ),

              /// Gap
              SizedBox(height: 16.0),

              /// Navigate to Completed todos Screen
              UButtonIcon(
                  myOnPressed: () => Get.to(TodosCompletedScreen()),
                  buttonText: 'Completed ToDos',
                  buttonIcon: Icon(
                    Icons.task_alt,
                    color: Colors.white,
                  )),

              /// Gap
              SizedBox(height: 16.0),

              /// Navigate to Pending todos Screen
              UButtonIcon(
                  myOnPressed: () => Get.to(TodosPendingScreen()),
                  buttonText: 'Pending ToDos',
                  buttonIcon: Icon(
                    Icons.error_outline,
                    color: Colors.white,
                  )),

              /// Line Divider 02
              Padding(
                padding: EdgeInsets.all(24.0),
                child: Divider(color: Colors.orange.shade200, thickness: 2.0),
              ),

              /// Navigate to User Wise todos Screen
              UButtonIcon(
                  myOnPressed: () => Get.to(ToDosUsersScreen(
                        allToDos: controller.allTodo,
                      )),
                  buttonText: 'User Wise ToDos',
                  buttonIcon: Icon(
                    Icons.account_circle_outlined,
                    color: Colors.white,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
