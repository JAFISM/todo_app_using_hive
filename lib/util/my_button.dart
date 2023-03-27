import 'package:flutter/material.dart';
import 'package:todo_app_using_hive/global%20values/colors.dart';
class MyButton extends StatelessWidget {

  final String text;
  VoidCallback onPressed;

  MyButton({Key? key, required this.text,required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: tdBlue,
      child: Text(text),
    );
  }
}
