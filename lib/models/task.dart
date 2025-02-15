import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  final String id;
  final String title;
  final String description;
  final GeoPoint location;
  final String address;
  final String assignedUserId;
  final String status;
  final DateTime createdAt;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.address,
    required this.assignedUserId,
    this.status = 'new',
    required this.createdAt,
  });

  factory Task.fromFirestore(DocumentSnapshot doc) {
    return Task(
      id: doc.id,
      title: doc['title'],
      description: doc['description'],
      location: doc['location'],
      address: doc['address'],
      assignedUserId: doc['assignedUserId'],
      status: doc['status'],
      createdAt: (doc['createdAt'] as Timestamp).toDate(),
    );
  }
}