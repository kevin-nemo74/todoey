import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  const TaskTile({
    super.key,
  });

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'This is a task',
        style: TextStyle(
          decoration: isChecked! ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: TaskCheckBox(
        checkBoxState: isChecked!,
        checkBoxCallBack: (newValue) {
          setState(() {
            isChecked = newValue;
          });
        },
      ),
    );
  }
}

class TaskCheckBox extends StatelessWidget {
  TaskCheckBox({required this.checkBoxState, required this.checkBoxCallBack});
  final bool checkBoxState;
  void Function(bool?)? checkBoxCallBack;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: checkBoxState,
      onChanged: checkBoxCallBack,
    );
  }
}
