import 'package:flutter/material.dart';
import 'package:todoey/components/tasksTile.dart';

import '../models/task.dart';

class TasksList extends StatefulWidget {
  final List<Task> tasks;
  final Function(int) onTaskDelete; // Add a callback function for task deletion

  TasksList({required this.tasks, required this.onTaskDelete});

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          isChecked: widget.tasks[index].isDone,
          taskTitle: widget.tasks[index].name,
          checkBoxCallBack: (bool? newValue) {
            setState(() {
              widget.tasks[index].toggleDone();
            });
          },
          onTaskDelete: () {
            // Implement the deletion callback
            // Call the onTaskDelete callback passed from the parent widget with the index of the task to delete
            widget.onTaskDelete(index);
          },
        );
      },
      itemCount: widget.tasks.length,
    );
  }
}
