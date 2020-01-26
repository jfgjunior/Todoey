import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoye_flutter/screens/tasks_screen.dart';
import 'package:todoye_flutter/widgets/task_tile.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, taskProvider, child) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: ListView.builder(
          padding: EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          itemBuilder: (context, position) => TaskTile(
            task: taskProvider.tasks[position],
          ),
          itemCount: taskProvider.tasks.length,
        ),
      ),
    );
  }
}
