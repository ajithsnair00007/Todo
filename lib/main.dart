import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todoprovider.dart';

import 'screens/homescreen.dart';


void main() {
  runApp(const TodoHome());
}

class TodoHome extends StatefulWidget {
  const TodoHome({super.key});

  @override
  State<TodoHome> createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  @override
  Widget build(BuildContext context) {
   
    return ChangeNotifierProvider(
      create: (context) {
       return ProviderTodo();
      },
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TodoHomeScreen(),
      ),
    );
  }
}
