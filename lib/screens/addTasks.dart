import 'dart:ffi';

import 'package:flutter/material.dart';

class addTasks extends StatefulWidget {
  void Function(dynamic)? callBack;
  addTasks(this.callBack);

  @override
  State<addTasks> createState() => _addTasksState();
}

class _addTasksState extends State<addTasks> {
  String? newTaskTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Add Task",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              color: Colors.lightBlueAccent,
            ),
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (value) {
              setState(() {
                newTaskTitle = value;
              });
            },
          ),
          SizedBox(
            height: 25,
          ),
          SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                widget.callBack!(newTaskTitle);
              },
              child: Text('Add'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
