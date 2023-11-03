import 'package:flutter/material.dart';
import 'package:todo_list/ui/widgets/%20task_card_widget.dart';
import 'package:todo_list/ui/widgets/header_title_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const HeaderTitleWidget(text: 'Today'),
      ),
      body: const TaskCardWidget(title: 'Teste',),
    );
  }
}
