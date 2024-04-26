import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do/date/database.dart';
import 'package:to_do/util/dialog_box.dart';
import 'package:to_do/util/todo_util.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // reference the hive box
  final _myBox = Hive.box('mybox');
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    // super.initState();
    if (_myBox.get('TODOLIST') == null){
      db.createInitialData();
    }
    else {
      db.loadData();
    }
  }

  // Text Controller
  final _controller = TextEditingController();

  // CheckBox Was Tapped
  void checkBoxChanged (bool? value , int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDatabase();
  }

  // Save New Task
  void saveNewTask(){
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  // Create A New Task
  void createNewTask(){
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop,
        );
      },
    );
  }

  // delete Task
  void deleteTask(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueAccent[200],
        title: const Text(
          'TO DO',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.white
          ),
        ),
        elevation: 3,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Colors.blueAccent[200],
        child: const Icon(Icons.add, color: Colors.white,),

      ),
      body: ListView.builder(
        itemBuilder: (context , index){
          return TodoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
        itemCount: db.toDoList.length,
      ),
    );
  }
}
