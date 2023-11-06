import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/models/task_model.dart';

class TaskController extends GetxController {
  static TaskController get to => Get.find();
  static const keyName = 'task';
  TextEditingController textController = TextEditingController();
  List<TaskModel> tasks = List.empty(growable: true);
  bool isChecked = false;
  late SharedPreferences prefs;

  getSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    getTask();
  }

  getTask() {
    List<String>? taskList = prefs.getStringList(keyName);
    if (taskList != null) {
      tasks = taskList
          .map((task) => TaskModel.fromJson(json.decode(task)))
          .toList();
    } 
    update();
  }

  saveTask() {
    List<String> taskList =
        tasks.map((task) => jsonEncode(task.toJson())).toList();

    prefs.setStringList(keyName, taskList);
  }

  deleteTask(int index) {
    tasks.removeAt(index);
  }
}
