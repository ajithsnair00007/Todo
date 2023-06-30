import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
import 'package:todo_app/models/todo.dart';

class ProviderTodo with ChangeNotifier{
  List <Todo> todos = [];
  List <Todo> get todo => todos;

  void addTodo(Todo todo){
    todos.add(todo);
    notifyListeners();
  }

  void todoCompleted(int index) {
    todos[index].completed =!todos[index].completed;
    notifyListeners();
  }
}