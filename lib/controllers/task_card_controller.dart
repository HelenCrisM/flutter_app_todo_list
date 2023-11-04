import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskCardController extends GetxController {
     static TaskCardController get to => Get.find();

  Color getTextColor(bool isChecked) {
    if (isChecked) {
      //Logic to be checked if checkbox is clicked
        return Colors.grey;
      
    } else {
      //Logic to be checked if checkbox is unticked
      return Colors.black;
    }
  }

  TextDecoration getTextDecoration(bool isChecked) {
    if (isChecked) {
      //Logic to be checked if checkbox is clicked
      return TextDecoration.lineThrough;
    } else {
      //Logic to be checked if checkbox is unticked
      return TextDecoration.none;
    }
  }

}