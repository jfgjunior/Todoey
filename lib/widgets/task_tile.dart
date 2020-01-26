import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoye_flutter/model/task.dart';
import 'package:todoye_flutter/screens/tasks_screen.dart';

class TaskTile extends StatelessWidget {
  final Task task;

  TaskTile({@required this.task});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, taskProvider, child) {
        return ListTile(
          onLongPress: () => taskProvider.remove(task),
          title: Text(
            task.name,
            style: TextStyle(
              fontSize: 18.0,
              decoration: task.isDone ? TextDecoration.lineThrough : null,
            ),
          ),
          trailing: Checkbox(
            value: task.isDone,
            onChanged: (whatever) => taskProvider.update(task),
          ),
        );
      },
    );
  }
}
