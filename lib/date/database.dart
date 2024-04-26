import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase{
  List toDoList = [];

  // reference our box
  final _myBox = Hive.box('mybox');

  // run this method if this is the 1st time ever opening this app
  void createInitialData () {
    toDoList = [
      ['Make tou' , false],
      ['get data ' , false],
    ];
  }

  void loadData () {
    toDoList = _myBox.get('TODOLIST');
  }

  void updateDatabase () {
    _myBox.put('TODOLIST', toDoList);
  }
}