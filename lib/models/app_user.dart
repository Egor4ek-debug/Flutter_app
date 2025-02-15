import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser {
  final String uid;
  final String email;
  final String role;
  final String? fcmToken;

  AppUser({
    required this.uid,
    required this.email,
    required this.role,
    this.fcmToken,
  });

  factory AppUser.fromFirestore(DocumentSnapshot doc) {
    return AppUser(
      uid: doc.id,
      email: doc['email'],
      role: doc['role'],
      fcmToken: doc['fcmToken'],
    );
  }
}