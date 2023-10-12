import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];
  //ref the hive box
  final _myBox = Hive.box('mybox');

  // run this method if this is the first time ever opening the app
  void createInitialData() {
    toDoList = [
      ["Make ToDo App", false],
      ["Complete Assignments", false],
    ];
  }

  //load the data from the database
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  //update the database
  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
