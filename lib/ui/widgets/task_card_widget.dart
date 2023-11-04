import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/controllers/task_card_controller.dart';

import '../../controllers/task_controller.dart';

// ignore: must_be_immutable
class TaskCardWidget extends StatefulWidget {
  TaskCardWidget({
    super.key,
    required this.title,
    required this.removeItem,
    required this.isChecked,
  });

  final String title;
  final VoidCallback removeItem;
  bool isChecked;

  @override
  State<TaskCardWidget> createState() => _TaskCardWidgetState();
}

class _TaskCardWidgetState extends State<TaskCardWidget> {
  TaskCardController controller = Get.put(TaskCardController());
  TaskController taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: ListTile(
          leading: Checkbox(
            checkColor: Colors.white,
            value: widget.isChecked,
            shape: const CircleBorder(),
            onChanged: (bool? value) {
              setState(() {
                widget.isChecked = value!;
              });
              log('Fui clicado! ${widget.isChecked}');

              taskController.saveTask();
            },
          ),
          trailing: TextButton(
            onPressed: widget.removeItem,
            child: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
          title: Text(
            widget.title,
            style: TextStyle(
              color: controller.getTextColor(widget.isChecked),
              decoration: controller.getTextDecoration(widget.isChecked),
            ),
          )),
    );
  }
}
