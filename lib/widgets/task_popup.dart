import 'package:flutter/material.dart';
import 'package:todoye_flutter/model/task.dart';

class TaskPopup extends StatefulWidget {
  final Function(Task task) callback;

  TaskPopup({@required this.callback});

  @override
  _TaskPopupState createState() => _TaskPopupState();
}

class _TaskPopupState extends State<TaskPopup> {
  String title = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Add Task",
          style: TextStyle(
            color: Colors.lightBlue,
            fontSize: 40.0,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
        TextField(
          autofocus: true,
          textAlign: TextAlign.center,
          onChanged: (text) => title = text,
        ),
        SizedBox(
          height: 10.0,
        ),
        FlatButton(
          onPressed: () => widget.callback(Task(name: title)),
          color: Colors.lightBlue,
          child: Text(
            "Add",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
