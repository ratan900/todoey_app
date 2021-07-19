import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {

  TaskTile({this.isChecked,this.taskTitle,this.checkBoxCallback});

  final bool isChecked;
  final String taskTitle;
  final Function checkBoxCallback;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(taskTitle,style: TextStyle(decoration:isChecked? TextDecoration.lineThrough:null),),
      trailing: Checkbox(
    value: isChecked,
    activeColor: Colors.lightBlueAccent,
    onChanged:checkBoxCallback,
    ),

    );
  }
}




