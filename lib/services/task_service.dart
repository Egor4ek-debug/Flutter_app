import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/task.dart';

class TaskService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<Task>> getTasksForUser(String userId) {
    return _db.collection('tasks')
        .where('assignedUserId', isEqualTo: userId)
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map((doc) => Task.fromFirestore(doc))
        .toList());
  }

  Future<void> updateTaskStatus(String taskId, String status) {
    return _db.collection('tasks').doc(taskId).update({'status': status});
  }

  Future<void> createTask(Task task) async {
    await _db.collection('tasks').doc(task.id).set({
      'title': task.title,
      'description': task.description,
      'location': task.location,
      'address': task.address,
      'assignedUserId': task.assignedUserId,
      'status': task.status,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }
}