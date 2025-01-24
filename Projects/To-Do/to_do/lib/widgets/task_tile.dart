import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final VoidCallback toggleTask;
  final VoidCallback deleteTask;

  TaskTile(
      {required this.task, required this.toggleTask, required this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.title,
        style: TextStyle(
          decoration: task.isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      leading: Checkbox(
        value: task.isDone,
        onChanged: (value) => toggleTask(),
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: deleteTask,
      ),
    );
  }
}
