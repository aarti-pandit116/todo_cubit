import 'package:flutter/material.dart';

class TodoModel {
  final String id;
  final String title;
  final String date;
  final Color backgroundColor;
  final bool isDone;
  final String iconAsset;

  TodoModel({
    required this.id,
    required this.title,
    required this.date,
    required this.backgroundColor,
    this.isDone = false,
    this.iconAsset = '',
  });

  TodoModel copyWith({
    String? id,
    String? title,
    String? date,
    Color? backgroundColor,
    bool? isDone,
    String? iconAsset,
  }) {
    return TodoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      date: date ?? this.date,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      isDone: isDone ?? this.isDone,
      iconAsset: iconAsset ?? this.iconAsset,
    );
  }
}

