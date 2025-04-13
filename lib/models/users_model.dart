import 'package:flutter/material.dart';

class User {
  const User(
      {required this.userId,
        required this.title,
        this.color = Colors.orange,
        required this.image});

  final int userId;
  final String title;
  final Color color;
  final String image;
}