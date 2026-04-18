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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'date': date,
      'backgroundColor': backgroundColor.value,
      'isDone': isDone,
      'iconAsset': iconAsset,
    };
  }

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'] as String,
      title: json['title'] as String,
      date: json['date'] as String,
      backgroundColor: Color(json['backgroundColor'] as int),
      isDone: json['isDone'] as bool,
      iconAsset: json['iconAsset'] as String,
    );
  }
}

