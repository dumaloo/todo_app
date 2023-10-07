import 'package:flutter/material.dart';
import 'package:todo_flutter/util/dialog_box.dart';
import 'package:todo_flutter/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //text controller
  final _controller = TextEditingController();

  //list of todo tasks
  List todoList = [
    ["Make ToDo App", false],
    ["College Assignments", false],
  ];

  //checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
      // if it is true set it to false if false set it to true
    });
  }

  //save new task
  void saveNewTask() {
    setState(() {
      todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  //create a new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  //delete task
  void deleteTask(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[300],
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: const Center(
          child: Text(
            'TO DO',
          ),
        ),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: todoList[index][0],
            taskCompleted: todoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteTask: (p0) => deleteTask(index),
          );
        },
      ),
    );
  }
}
