import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/providers/user_provider.dart';
import 'package:task_manager/screens/auth/login_screen.dart';
import 'package:task_manager/screens/admin/admin_home.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    if (user == null) return const LoginScreen();

    return user.role == 'admin'
        ? const AdminHome()
        : const EmployeeHome(); // Создайте EmployeeHome аналогично
  }
}