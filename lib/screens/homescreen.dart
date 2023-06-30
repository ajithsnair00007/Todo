import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/provider/todoprovider.dart';

class TodoHomeScreen extends StatefulWidget {
  const TodoHomeScreen({super.key});

  @override
  State<TodoHomeScreen> createState() => _TodoHomeScreenState();
}

class _TodoHomeScreenState extends State<TodoHomeScreen> {
  
  @override
  Widget build(BuildContext context) {
    
    var todoProvider =Provider.of<ProviderTodo>(context);
     
    return Scaffold(
      
      appBar: AppBar(
        title: Text('ToDo List'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        
        itemCount:todoProvider.todos.length ,
        itemBuilder:(context, index) {
          final todo = todoProvider.todos[index];
          return ListTile(
            title: Text(todo.title),
            leading: Checkbox(value: todo.completed,
            onChanged:(value) {
              todoProvider.todoCompleted(index);
            }, 
            
            ),
          );
        },),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            final newTodo = Todo(
              title: 'New Todo'
            );
            todoProvider.addTodo(newTodo);
          },
          child: Icon(Icons.add),),
    );
  }
}