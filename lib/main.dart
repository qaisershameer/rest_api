import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rest_api/controllers/todos_controller.dart';
import 'package:rest_api/views/home_screen.dart';
import 'controllers/home_controller.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final HomeScreenController controller = Get.put(HomeScreenController());
  final ToDosController todoController = Get.put(ToDosController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Rest API',
      theme: theme,
      home: HomeScreen(),
    );
  }
}
