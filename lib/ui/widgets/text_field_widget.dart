import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({super.key, required this.textController});

  final TextEditingController textController;
  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Ex. Fazer compras...',
      ),
    );
  }
}
