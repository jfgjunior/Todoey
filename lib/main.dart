import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoye_flutter/screens/tasks_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskProvider(),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
