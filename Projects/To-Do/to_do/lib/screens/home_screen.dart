import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/task.dart';
import '../widgets/task_tile.dart';
import 'add_task_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _addTask(String taskTitle) async {
    await FirebaseFirestore.instance.collection('tasks').add({
      'title': taskTitle,
      'isDone': false,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  void _deleteTask(String docId) async {
    await FirebaseFirestore.instance.collection('tasks').doc(docId).delete();
  }

  void _toggleTask(String docId, bool isDone) async {
    await FirebaseFirestore.instance.collection('tasks').doc(docId).update({
      'isDone': !isDone,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('To-Do List')),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('tasks').orderBy('timestamp').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          var tasks = snapshot.data!.docs;
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              var task = tasks[index];
              return TaskTile(
                task: Task(title: task['title'], isDone: task['isDone']),
                toggleTask: () => _toggleTask(task.id, task['isDone']),
                deleteTask: () => _deleteTask(task.id),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await showModalBottomSheet<String>(
            context: context,
            builder: (context) => AddTaskScreen(),
          );
          if (result != null) {
            _addTask(result);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
