import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoye_flutter/widgets/task_list.dart';
import 'package:todoye_flutter/widgets/task_popup.dart';
import 'package:todoye_flutter/model/task.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      floatingActionButton: _buildFAB(context),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: 30.0, top: 50.0, right: 30.0, bottom: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.filter_list,
                      size: 30.0,
                      color: Colors.lightBlue,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Todoey",
                    style: TextStyle(
                        fontSize: 50.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "${Provider.of<TaskProvider>(context).tasks.length} tasks",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: TaskList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFAB(BuildContext context) => FloatingActionButton(
        backgroundColor: Colors.lightBlue,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30.0,
        ),
        onPressed: () => showModalBottomSheet(
          context: context,
          builder: (context) => Container(
            child: Container(
              padding: EdgeInsets.only(top: 20.0, left: 40.0, right: 40.0),
              child: TaskPopup(
                callback: (Task task) {
                  Provider.of<TaskProvider>(context).add(task);
                  Navigator.pop(context);
                },
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0))),
          ),
        ),
      );
}

class TaskProvider extends ChangeNotifier {
  final List<Task> _tasks = [];

  UnmodifiableListView get tasks => UnmodifiableListView(_tasks);

  void add(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void remove(Task task) {
    _tasks.removeAt(tasks.indexOf(task));
    notifyListeners();
  }

  void update(Task task) {
    final int index = tasks.indexOf(task);
    _tasks[index].toggleTask();
    notifyListeners();
  }
}
