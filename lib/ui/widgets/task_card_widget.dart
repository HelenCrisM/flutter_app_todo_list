import 'package:flutter/material.dart';
import 'package:todo_list/controllers/task_card_controller.dart';

class TaskCardWidget extends StatefulWidget {
  const TaskCardWidget({super.key, required this.title});

  final String title;
  @override
  State<TaskCardWidget> createState() => _TaskCardWidgetState();
}

class _TaskCardWidgetState extends State<TaskCardWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: const ColoredBox(
        color: Colors.red,
        child: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(Icons.delete, color: Colors.white),
          ),
        ),
      ),
      child: ListTile(
          leading: Checkbox(
            checkColor: Colors.white,
            // fillColor: MaterialStateProperty.resolveWih(g),
            value: isChecked,
            shape: const CircleBorder(),
            onChanged: (bool? value) {
              setState(() {
                isChecked = value!;
              });
            },
          ),
          title: Text(
            widget.title,
            style: TextStyle(
              color: TaskCardController.getTextColor(isChecked),
              decoration: TaskCardController.getTextDecoration(isChecked),
            ),
          )),
    );
  }
}
