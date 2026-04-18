import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/models/todo_model.dart';

class TodoCubit extends Cubit<List<TodoModel>> {
  TodoCubit() : super([]);

  void addTodo(TodoModel todo) {
    emit([...state, todo]);
  }

  void deleteTodo(TodoModel todo) {
    emit(state.where((t) => t.id != todo.id).toList());
  }

  void updateTodo(TodoModel todo) {
    emit(state.map((t) => t.id == todo.id ? todo : t).toList());
  }
}
