import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api/const/const.dart';
import 'package:rest_api/custom_widgets/show_snack_bar.dart';
import '../models/todo_model.dart';
import '../models/users_model.dart';

class ToDosController extends GetxController {
  static ToDosController get instance => Get.find();

  /// Variables

  List<dynamic> data = [];
  RxList<int> userIds = <int>[].obs;

  RxList<ToDos> allTodo = <ToDos>[].obs;
  RxList<ToDos> completedToDo = <ToDos>[].obs;
  RxList<ToDos> pendingToDo = <ToDos>[].obs;
  RxList<ToDos> userWiseAllToDo = <ToDos>[].obs;
  RxList<ToDos> userWiseCompletedToDo = <ToDos>[].obs;
  RxList<ToDos> userWisePendingToDo = <ToDos>[].obs;

  /// available Users
  RxList<User> availableUsers = <User>[
    User(
        userId: 1,
        title: 'Lionel Messi\nArgentina',
        color: Colors.deepPurple,
        image: "assets/flags/ar.png"),
    User(
        userId: 2,
        title: 'Cristiano Ronaldo\nPortugal',
        color: Colors.deepOrange,
        image: "assets/flags/pt.png"),
    User(
        userId: 3,
        title: 'Neymar Jr.\nBrazil',
        color: Colors.brown,
        image: "assets/flags/br.png"),
    User(
        userId: 4,
        title: 'Kylian Mbappé\nFrance',
        color: Colors.yellowAccent,
        image: "assets/flags/fr.png"),
    User(
        userId: 5,
        title: 'Harry Kane\nEngland',
        color: Colors.cyan,
        image: "assets/flags/gb.png"),
    User(
        userId: 6,
        title: 'Robert Lewandowski\nPoland',
        color: Colors.lime,
        image: "assets/flags/pl.png"),
    User(
        userId: 7,
        title: 'Luka Modrić\nCroatia',
        color: Colors.indigo,
        image: "assets/flags/hr.png"),
    User(
        userId: 8,
        title: 'Mohamed Salah\nEgypt',
        color: Colors.lightGreenAccent,
        image: "assets/flags/eg.png"),
    User(
        userId: 9,
        title: 'Heung-min Son\nSouth Korea',
        color: Colors.pinkAccent,
        image: "assets/flags/kr.png"),
    User(
        userId: 10,
        title: 'Alphonso Davies\nCanada',
        color: Colors.tealAccent,
        image: "assets/flags/ca.png"),
  ].obs;

  /// todos initialized
  @override
  void onInit() {
    fetchToDos();
    super.onInit();
  }

  /// Functions /// Screen Logics
  Future<void> fetchToDos() async {
    try {
      /// URL
      Uri url = UConst.todoUrl;

      /// get response from URL
      final response = await http.get(url);

      /// response Output Checking
      if (response.statusCode == 200) {

        // +ve response successful action
        data = jsonDecode(response.body);

        /// all Todos value assign from fetched data
        allTodo.value = data.map((json) => ToDos.fromJson(json)).toList();

          // completed Todos value assign from all todos
          completedToDo.value = allTodo.where((filter) => filter.completed == true).toList();

          // pending Todos value assign from all todos
          pendingToDo.value = allTodo.where((filter) => filter.completed == false).toList();

        /// Extract userIds using Set from Json Response Data
        Set<int> getUserIds = data.map((item) => item['userId'] as int).toSet();

          // Set User Ids to List
          userIds.value = getUserIds.toList();

        /// +ve response success Snackbar
        USnackBars.successSnackBar(title: 'All ToDos Data successfully loaded: ${response.statusCode}');

      } else {

        /// -ve response error Snackbar
        USnackBars.errorSnackBar(title: 'Something went wrong: ${response.statusCode}');

      }
    } catch (e) {

      /// URL Error Snackbar
      USnackBars.errorSnackBar(title: 'Error: $e');

    }
  }

}
