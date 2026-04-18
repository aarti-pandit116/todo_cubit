import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/todo_model.dart';
import 'action_dialog.dart';

class TaskCard extends StatelessWidget {
  final TodoModel task;
  final ValueChanged<String>? onAction;

  const TaskCard({super.key, required this.task, this.onAction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final result = await showDialog<String>(
          context: context,
          builder: (context) => ActionDialog(task: task),
        );
        if (result != null && onAction != null) {
          onAction!(result);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color.lerp(
            task.backgroundColor,
            Colors.white,
            0.3,
          ), // Make color lighter
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xFF1E282A), // Dark border
            width: 2,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFF1E282A),
              offset: Offset(0, 4), // Hard drop shadow effect
              blurRadius: 0,
            ),
          ],
        ),
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF1E282A),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
            const SizedBox(width: 12),
            if (task.title.toLowerCase().contains('coffee') ||
                task.title.toLowerCase().contains('meet'))
              const Icon(
                Icons.coffee_outlined,
                color: Color(0xFF1E282A),
                size: 32,
              )
            else if (task.title.toLowerCase().contains('note'))
              const Icon(
                Icons.edit_document,
                color: Color(0xFF1E282A),
                size: 32,
              )
            else
              const Icon(Icons.task_alt, color: Color(0xFF1E282A), size: 32),
          ],
        ),
      ),
    );
  }
}
