import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/controllers/task_controller.dart';
import 'package:todo_list/models/task_model.dart';
import 'package:todo_list/ui/widgets/task_card_widget.dart';
import 'package:todo_list/ui/widgets/header_title_widget.dart';
import 'package:todo_list/ui/widgets/text_field_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isChecked = true;
  TaskController controller = Get.put(TaskController());
  

  @override
  void initState() {
    controller.getSharedPreferences();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const HeaderTitleWidget(text: 'Today'),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(children: [
              Row(children: <Widget>[
                Expanded(
                  child: TextFieldWidget(
                      textController: controller.textController),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    String text = controller.textController.text.trim();
                    if (text.isNotEmpty) {
                      setState(() {
                        controller.textController.text = '';

                        controller.tasks
                            .add(TaskModel(task: text, isDone: isChecked));
                      });
                      log('isChecked: $isChecked');
                      controller.saveTask();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Icon(Icons.add),
                ),
              ]),
              const SizedBox(height: 10),
               ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: controller.tasks.length,
                      itemBuilder: (context, index) {
                        final item = controller.tasks[index];
                        return TaskCardWidget(
                            title: item.task,
                            removeItem: () {
                              setState(() {
                                controller.deleteTask(index);
                              });

                              controller.saveTask();
                            },
                            isChecked: item.isDone);
                      })
            ])),
      ),
    );
  }
}
