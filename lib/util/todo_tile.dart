import 'package:flutter/material.dart';
import 'package:todo_app_using_hive/global%20values/colors.dart';
class ToDoTile extends StatelessWidget {
  ToDoTile({Key? key, required this.taskName, required this.taskCompleted,required this.onChanged}) : super(key: key);
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25,right: 25,top: 25),
      child: Container(
        child: Row(
          children: [
            Checkbox(value: taskCompleted, onChanged: onChanged,
              activeColor: tdRed,
            ),

            Text(taskName,style: TextStyle(color: Colors.white,decoration: taskCompleted?TextDecoration.lineThrough:TextDecoration.none,fontWeight: FontWeight.bold),),
          ],
        ),
        decoration: BoxDecoration(
          color: tdBlue,
          borderRadius: BorderRadius.circular(15)
        ),
        padding: EdgeInsets.all(25),
      ),
    );
  }
}
