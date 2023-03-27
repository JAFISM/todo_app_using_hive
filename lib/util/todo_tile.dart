import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app_using_hive/global%20values/colors.dart';
class ToDoTile extends StatelessWidget {
  ToDoTile(
      {Key? key, required this.taskName, required this.taskCompleted,required this.onChanged,required this.deleteFunction}
      ) : super(key: key);
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)?deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25,right: 25,top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion:const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction!,
              icon: Icons.delete,
              backgroundColor: tdRed,
              borderRadius: BorderRadius.circular(10),
            )
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: tdBlue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15)
          ),
          padding: const EdgeInsets.all(25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Checkbox(value: taskCompleted, onChanged: onChanged,
                activeColor: tdRed,
                side: const BorderSide(width: 2),
              ),
              Text(taskName,style: TextStyle(color: Colors.black,decoration: taskCompleted?TextDecoration.lineThrough:TextDecoration.none,fontWeight: FontWeight.bold),),
              IconButton(onPressed: (){
                deleteFunction?.call(context);
              }, icon: const Icon(Icons.delete,color: Colors.red,))
            ],
          ),
        ),
      ),
    );
  }
}
