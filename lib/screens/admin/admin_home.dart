import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/models/task.dart';
import 'package:task_manager/widgets/custom_app_bar.dart';
import 'package:task_manager/widgets/task_card.dart';
import 'package:task_manager/screens/admin/task_details_screen.dart';
import 'package:task_manager/screens/common/error_screen.dart';
import 'package:task_manager/screens/common/loading_screen.dart';

import '../../utils/routes.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Панель администратора'),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(context, Routes.createTask),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('tasks').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) return const ErrorScreen();
          if (!snapshot.hasData) return const LoadingScreen();

          final tasks = snapshot.data!.docs
              .map((doc) => Task.fromFirestore(doc))
              .toList();

          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) => TaskCard(
              task: tasks[index],
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => TaskDetailsScreen(task: tasks[index]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}