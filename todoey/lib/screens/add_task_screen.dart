import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTaskTitle;
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'ADD TASK',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlueAccent,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.0),
              child: TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (newText) {
                  newTaskTitle = newText;
                },
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.0),
              child: FlatButton(
                child: Text(
                  'ADD',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.lightBlueAccent,
                onPressed: () {
                  if (newTaskTitle != null) {
                    Provider.of<TaskData>(context, listen: false)
                        .addTask(newTaskTitle);
                    Navigator.pop(context);
                  } else {}
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
