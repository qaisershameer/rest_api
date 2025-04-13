import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:rest_api/controllers/todos_controller.dart';
import 'package:rest_api/models/todo_model.dart';
import 'package:rest_api/views/todos/todos_user_wise_screen.dart';
import '../../custom_widgets/user_grid_item.dart';

class ToDosUsersScreen extends StatefulWidget {
  const ToDosUsersScreen({super.key, required this.allToDos});

  final RxList<ToDos> allToDos;

  @override
  State<ToDosUsersScreen> createState() => _ToDosUsersScreenState();
}

class _ToDosUsersScreenState extends State<ToDosUsersScreen>
    with SingleTickerProviderStateMixin {
  final controller = Get.find<ToDosController>();
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// Animation Builder for Categories on Screen Load
    return Scaffold(
      appBar: AppBar(
          title: Text('Famous Footballers (Users)'),
          backgroundColor: Colors.blue.shade500),
      body: AnimatedBuilder(
        animation: _animationController,
        child: GridView(
          padding: EdgeInsets.all(24.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),

          /// Category List Display via loop and generate Category Wise Filtered Meals List
          children: [
            for (var user in controller.availableUsers)
              UserGridItem(
                user: user,
                onSelectUser: () {
                  // print('User tapped!');

                  final filteredToDos = controller.allTodo
                      .where((todo) => todo.userId == user.userId)
                      .toList();

                  /// Navigate to Meal Screen with these above Selected Category Wise filter Meals
                  Get.to(() => TodosUserWiseScreen(todos: filteredToDos));
                },
              ),
          ],
        ),

        /// Animation Effect define here.
        builder: (context, child) => SlideTransition(
            position: Tween(
              begin: Offset(0, 0.3),
              end: Offset(0, 0),
            ).animate(CurvedAnimation(
                parent: _animationController, curve: Curves.easeInOut)),
            child: child),
      ),
    );
  }
}
