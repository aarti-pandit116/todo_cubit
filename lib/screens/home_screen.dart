import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_cubit/bloc/todo_cubit.dart';
import '../models/todo_model.dart';
import '../widgets/task_card.dart';
import '../widgets/add_task_bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  void _showAddTaskSheet(
    BuildContext context, {
    TodoModel? taskToEdit,
    int? editIndex,
  }) async {
    final result = await showModalBottomSheet<TodoModel>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => AddTaskBottomSheet(initialTask: taskToEdit),
    );

    if (result != null) {
      // The bottom sheet already handles adding/updating via Bloc
    }
  }

  void _handleTaskAction(String action, int index, TodoModel task) {
    final todoCubit = BlocProvider.of<TodoCubit>(context);
    if (action == 'edit') {
      _showAddTaskSheet(context, taskToEdit: task, editIndex: index);
    } else if (action == 'done') {
      todoCubit.deleteTodo(task);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${task.title} completed!'),
          backgroundColor: const Color(0xFF1E282A),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF268C8C),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            BlocBuilder<TodoCubit, List<TodoModel>>(
              builder: (context, todos) {
                return Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    itemCount: todos.length,
                    itemBuilder: (context, index) {
                      final task = todos[index];
                      // Added Dismissible tile to delete securely
                      return Dismissible(
                        key: Key(task.title + index.toString()),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          margin: const EdgeInsets.only(bottom: 16.0),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: Colors.redAccent.withValues(alpha: 0.5),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          alignment: Alignment.centerRight,
                          child: const Icon(
                            Icons.delete_outline,
                            color: Colors.white,
                            size: 32,
                          ),
                        ),
                        onDismissed: (direction) {
                          BlocProvider.of<TodoCubit>(context).deleteTodo(task);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('${task.title} deleted')),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: TaskCard(
                            task: task,
                            onAction: (action) =>
                                _handleTaskAction(action, index, task),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTaskSheet(context),
        backgroundColor: const Color(0xFF1E282A),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              text: 'Todo List ',
              style: GoogleFonts.poppins(
                color: const Color(0xFFFFD48F), // Yellow/sand color
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: 'Keep Smile!',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // IconButton(
          //   onPressed: () => _showAddTaskSheet(context),
          //   icon: const Icon(Icons.add, color: Colors.white, size: 28),
          // ),
        ],
      ),
    );
  }
}
