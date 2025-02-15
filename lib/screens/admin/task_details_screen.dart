import 'package:flutter/material.dart';
import 'package:task_manager/models/task.dart';

class TaskDetailsScreen extends StatelessWidget {
  final Task task;

  const TaskDetailsScreen({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(task.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Описание: ${task.description}'),
            Text('Статус: ${task.status}'),
            Text('Адрес: ${task.address}'),
          ],
        ),
      ),
    );
  }
}