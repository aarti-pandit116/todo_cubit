import 'package:flutter/material.dart';

class TaskModel {
  final String title;
  final String timeRange;
  final String date;
  final Color backgroundColor;
  final bool isDone;
  final String iconAsset; // mock icon reference if we have any, or use flutter icons

  TaskModel({
    required this.title,
    required this.timeRange,
    required this.date,
    required this.backgroundColor,
    this.isDone = false,
    this.iconAsset = '',
  });
}

List<TaskModel> mockTasks = [
  TaskModel(
    title: 'Call Elon',
    timeRange: '11:00',
    date: 'Mo (Jan 30)',
    backgroundColor: const Color(0xFFB2F3DF), // Light mint
  ),
  TaskModel(
    title: 'Meet Irchick',
    timeRange: '16:00-17:00',
    date: 'Mo (Jan 30)',
    backgroundColor: const Color(0xFFB2F3DF),
  ),
  TaskModel(
    title: 'Review notes',
    timeRange: '20:00',
    date: 'Mo (Jan 30)',
    backgroundColor: const Color(0xFFB2F3DF),
  ),
  TaskModel(
    title: 'Meet Uriyovich',
    timeRange: '21:00',
    date: 'Mo (Jan 30)',
    backgroundColor: const Color(0xFFB2F3DF),
  ),
  TaskModel(
    title: 'Squash with I.',
    timeRange: '9:00',
    date: 'Tu (Jan 31)',
    backgroundColor: const Color(0xFFB2F3DF),
  ),
  TaskModel(
    title: 'Review design system for AUTO RIA',
    timeRange: '9:00',
    date: 'We (Feb 1)',
    backgroundColor: const Color(0xFFB2F3DF),
  ),
  TaskModel(
    title: 'Finish dribbble shot',
    timeRange: 'All day',
    date: 'Mo (Jan 30)',
    backgroundColor: const Color(0xFFFFD48F), // Light sand/yellow
  ),
  TaskModel(
    title: 'Withdraw money',
    timeRange: 'All day',
    date: 'Mo (Jan 30)',
    backgroundColor: const Color(0xFFFFD48F),
  ),
  TaskModel(
    title: 'Post to sharovary',
    timeRange: 'All day',
    date: 'We (Feb 1)',
    backgroundColor: const Color(0xFFFFD48F),
  ),
];
