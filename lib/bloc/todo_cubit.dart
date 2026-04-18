import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/models/todo_model.dart';
import 'package:todo_cubit/services/todo_storage.dart';

class TodoCubit extends Cubit<List<TodoModel>> {
  final TodoStorage storage = TodoStorage();

  TodoCubit() : super([]) {
    loadTodos();
  }

  Future<void> loadTodos() async {
    final todos = await storage.readTodos();
    emit(todos);
  }

  Future<void> _saveTodos() async {
    await storage.writeTodos(state);
  }

  void addTodo(TodoModel todo) {
    emit([...state, todo]);
    _saveTodos();
  }

  void deleteTodo(TodoModel todo) {
    emit(state.where((t) => t.id != todo.id).toList());
    _saveTodos();
  }

  void updateTodo(TodoModel todo) {
    emit(state.map((t) => t.id == todo.id ? todo : t).toList());
    _saveTodos();
  }
}
