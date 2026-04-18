import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/task_model.dart';

class ActionDialog extends StatelessWidget {
  final TaskModel task;

  const ActionDialog({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          // The main card wrapped in a slight rotation for visual pop
          Transform.rotate(
            angle: -0.05,
            child: Container(
              margin: const EdgeInsets.only(bottom: 80),
              decoration: BoxDecoration(
                color: task.backgroundColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: const Color(0xFF1E282A),
                  width: 2,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFF1E282A),
                    offset: Offset(0, 8), // Heavy shadow
                    blurRadius: 0,
                  ),
                ],
              ),
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          task.title,
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF1E282A),
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${task.timeRange} ${task.date}',
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF1E282A).withOpacity(0.8),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.coffee_outlined,
                    color: Color(0xFF1E282A),
                    size: 40,
                  ),
                ],
              ),
            ),
          ),
          
          // Action Buttons panel (aligned to bottom)
          Positioned(
            bottom: -20,
            child: Container(
              width: 280,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF268C8C),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: const Color(0xFF1E282A),
                  width: 2,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFF1E282A),
                    offset: Offset(0, 4),
                    blurRadius: 0,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildButton(
                    text: 'Edit',
                    color: Colors.white,
                    textColor: const Color(0xFF1E282A),
                    onTap: () {
                      Navigator.pop(context, 'edit');
                    },
                  ),
                  _buildButton(
                    text: 'Done',
                    color: const Color(0xFFFFD48F), // Yellow Sand
                    textColor: const Color(0xFF1E282A),
                    icon: Icons.check,
                    onTap: () {
                      Navigator.pop(context, 'done');
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required String text,
    required Color color,
    required Color textColor,
    IconData? icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0xFF1E282A),
            width: 2,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: GoogleFonts.poppins(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (icon != null) ...[
              const SizedBox(width: 8),
              Icon(icon, color: textColor, size: 20),
            ]
          ],
        ),
      ),
    );
  }
}
