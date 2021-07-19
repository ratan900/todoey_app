import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoeyflutter/widgets/task_list.dart';
import 'package:todoeyflutter/model/tasks.dart';
class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  String newValue;

    Widget buildBottomSheet(BuildContext context){
      return Container(
        color: Color(0xff757575),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),topLeft: Radius.circular(20),
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                  'Add a task',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.lightBlueAccent,
                ),
              ),
              TextField(
              autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (newText){
                newValue=newText;
                },
              ),
              FlatButton(onPressed: (){
                setState(() {
                  tasks.add(Task(name: newValue));
                });

              },
                  child:Text(
                    'ADD',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                color: Colors.lightBlueAccent,
              )
            ],
          ),
        ),
      );
    }

    List<Task> tasks=[
      Task(name:'Buy milk'),
      Task(name:'Buy food' ),
      Task(name:'Buy Bread')
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
        onPressed: (){
          showModalBottomSheet(context: context, builder: buildBottomSheet);
        },
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top:60 ,left:30 ,right:30 ,bottom:30 ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    size: 30.0,
                    color: Colors.lightBlueAccent,
                  ),
                  backgroundColor: Colors.white,
                  radius: 30,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'todoey',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '3 task left',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),

              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft:Radius.circular(20),topRight: Radius.circular(20))
              ),
              child: TaskView(tasks),
            ),
          )
        ],
      )
    );
  }
}




