

import 'package:flutter/material.dart';
import '../model/todo.dart';
import 'package:appone/constants/color.dart';


//two components - to do page, to do item 

class ToDoItem extends StatelessWidget {
  final ToDo todo; //holds the stae and text 
  final onToDoChanged; //toggles 
  final onDeleteItem;//to delete

  const ToDoItem({
    Key? key,
    required this.todo,
    required this.onToDoChanged,
    required this.onDeleteItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: tdBlue,
        ),
        title: Text(
          todo.todoText!, //this is for eaxh to do title setting
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 16,
            color: const Color.fromARGB(255, 0, 0, 0),
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: Icon(Icons.delete),
            onPressed: () {
              onDeleteItem(todo.id);
            },
          ),
        ),
      ),
    );
  }
}


/*To-Do Actions: Each ToDoItem has two callback placeholders: onToDoChanged (for marking the item as done) and onDeleteItem (for deleting the item). These callbacks are not yet implemented in this snippet.
*/ 

class ToDoPage extends StatelessWidget {
  final List<ToDo> todoList; 

  const ToDoPage({Key? key, required this.todoList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Add gradient background
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.lightGreen.shade100, 
              const Color.fromARGB(255, 186, 163, 125), 
            ],
          ),
        ),
        padding: EdgeInsets.all(16.0), 
        child: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return ToDoItem(
              todo: todoList[index],
              onToDoChanged: (todo) {
               
              },
              onDeleteItem: (id) {
                
              },
            );
          },
        ),
      ),
    );
  }
}
