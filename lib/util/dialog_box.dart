import 'package:flutter/material.dart';
//import 'package:todo_app_using_hive/global%20values/colors.dart';
import 'package:todo_app_using_hive/util/my_button.dart';

class DialogBox extends StatelessWidget {
  DialogBox({Key? key, required this.controller,required this.onCancel,required this.onSave}) : super(key: key);
final controller;
VoidCallback onSave;
VoidCallback onCancel;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //get user input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                hintText: "Add a new task",
              ),
            ),
            //buttons-> save+cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save button
                MyButton(text: "Save", onPressed: onSave),
                const SizedBox(width: 8,),
                //cancel button
                MyButton(text: "cancel", onPressed: onCancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
