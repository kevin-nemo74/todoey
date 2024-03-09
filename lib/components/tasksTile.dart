import 'package:flutter/material.dart';

import '../models/task.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  void Function(bool?)? checkBoxCallBack;
  final VoidCallback? onTaskDelete;

  TaskTile({
    required this.isChecked,
    required this.taskTitle,
    required this.checkBoxCallBack,
    this.onTaskDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Expanded(
            child: Text(
              taskTitle,
              style: TextStyle(
                decoration: isChecked! ? TextDecoration.lineThrough : null,
              ),
            ),
          ),
          Checkbox(
            value: isChecked,
            onChanged: checkBoxCallBack,
          ),
          GestureDetector(
            onTap: onTaskDelete,
            child: Icon(
              Icons.close,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
