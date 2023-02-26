import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app_using_hive/data/database.dart';
import 'package:todo_app_using_hive/util/dialog_box.dart';
import '../global values/colors.dart';
import '../util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ///reference the hive box
  final _myBox=Hive.box("mybox");
  ToDoDatabase db=ToDoDatabase();

  @override
  void initState() {
    // if this is the first time ever open in the app,then create default data
    if(_myBox.get("TODOLIST")==null){
      db.createInitialData();
    }else{
    // there already exists data
      db.loadData();
    }
    super.initState();
  }

  ///text controller
  final _controller = TextEditingController();

  // ///list of to do tasks
  // List toDoList = [];

  ///check box tapped

  void checkBoxChanged(bool? value, int index) {
    setState(() {
     db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  ///save new task
  void saveNewTask() {
    setState(() {
     db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  ///create new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  /// delete task
  void deleteTask(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
     db.updateDataBase();
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
          onPressed: createNewTask,
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunction: (context)=>deleteTask(index),
            );
          },
        ),
      ),
    );
  }
}
