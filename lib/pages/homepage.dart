import 'package:flutter/material.dart';
import '../global values/colors.dart';
import '../util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ///list of todo tasks
  List toDoList = [
    [
      "Make tutorial",
      false,
    ],
    [
      "Make tutorial",
      false,
    ],
    [
      "Make tutorial",
      false,
    ],
    [
      "Make tutorial",
      false,
    ],
    [
      "Make tutorial",
      false,
    ],
  ];

  ///check box tapped

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1]=!toDoList[index][1];
    });
  }

  ///create new task
  ///
  void createNewTask(){

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: tdBGColor,
        appBar: AppBar(
          title: Text(
            "To Do",
            style: TextStyle(color: Colors.white),
          ),
          elevation: 0,
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: tdBlue,
          onPressed:createNewTask,
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: toDoList[index][0],
              taskCompleted: toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
            );
          },
        ),
      ),
    );
  }
}
