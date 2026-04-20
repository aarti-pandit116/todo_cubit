import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:todo_cubit/models/todo_model.dart';

class TodoStorage {
  static const String _fileName = 'todos.json';

  Future<String> get _localPath async {
    // getExternalStorageDirectory() provides a path that is usually visible in file managers
    // (e.g., Android/data/com.package.name/files)
    Directory? directory = await getExternalStorageDirectory();
    
    // Fallback to internal storage if external storage is not available (e.g. on iOS or web)
    directory ??= await getApplicationDocumentsDirectory();
    
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$_fileName');
  }

  Future<List<TodoModel>> readTodos() async {
    try {
      final file = await _localFile;
      if (!await file.exists()) {
        return [];
      }

      final contents = await file.readAsString();
      final List<dynamic> jsonList = json.decode(contents);
      return jsonList.map((json) => TodoModel.fromJson(json)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<File> writeTodos(List<TodoModel> todos) async {
    final file = await _localFile;
    final String contents = json.encode(todos.map((todo) => todo.toJson()).toList());
    return file.writeAsString(contents);
  }
}
