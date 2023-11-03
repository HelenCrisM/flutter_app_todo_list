import 'package:flutter/material.dart';

class TaskCardController {
  static Color getTextColor(bool isChecked) {
    if (isChecked) {
      //Logic to be checked if checkbox is clicked
        return Colors.grey;
      
    } else {
      //Logic to be checked if checkbox is unticked
      return Colors.black;
    }
  }

  static TextDecoration getTextDecoration(bool isChecked) {
    if (isChecked) {
      //Logic to be checked if checkbox is clicked
      return TextDecoration.lineThrough;
    } else {
      //Logic to be checked if checkbox is unticked
      return TextDecoration.none;
    }
  }

}