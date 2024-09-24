import 'package:flutter/material.dart';
import 'package:socially_app/features/auth/domain/entities/user.dart';

class StoryModel {
  int id;
  User user;
  List<StoryChild> children;

  StoryModel({
    required this.id,
    required this.user,
    required this.children,
  });
}

class StoryChild {
  String? image;
  String? text;
  Color backgroundColor;
  bool visited;

  StoryChild({
    this.image,
    this.text,
    this.backgroundColor = const Color(0xff1c5dba),
    this.visited = false,
  });
}
