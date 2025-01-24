import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(labelText: 'New Task'),
          ),
          SizedBox(height:10),
          ElevatedButton(
            onPressed: (){
              if(_controller.text.isNotEmpty){
                Navigator.pop(context, _controller.text);
              }
            }, 
            child: Text('Add Task')
          ),
        ],
      ),
    );
  }
}
