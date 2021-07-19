import 'package:flutter/material.dart';
import 'package:todoeyflutter/widgets/task_tile.dart';
import 'package:todoeyflutter/model/tasks.dart';
import 'package:todoeyflutter/screens/task_screen.dart';

class TaskView extends StatefulWidget {
  final List<Task> tasks ;
  TaskView(this.tasks);

  @override
  _TaskViewState createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context,index){
          return TaskTile(isChecked:widget.tasks[index].isDone ,
              taskTitle: widget.tasks[index].name,
              checkBoxCallback:(newValue) {
                setState(() {
                  widget.tasks[index].toggleDone();
                },);
              },);
        },
      itemCount: widget.tasks.length,
    );
  }
}