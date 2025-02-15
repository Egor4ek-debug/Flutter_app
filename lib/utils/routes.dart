import 'package:flutter/material.dart';
import 'package:task_manager/screens/auth/auth_wrapper.dart';
import 'package:task_manager/screens/auth/login_screen.dart';
import 'package:task_manager/screens/admin/admin_home.dart';
import 'package:task_manager/screens/admin/create_task_screen.dart';

class Routes {
  static const initial = '/';
  static const login = '/login';
  static const adminHome = '/admin_home';
  static const employeeHome = '/employee_home';
  static const createTask = '/create_task';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initial:
        return MaterialPageRoute(builder: (_) => const AuthWrapper());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case adminHome:
        return MaterialPageRoute(builder: (_) => const AdminHome());
      case createTask:
        return MaterialPageRoute(builder: (_) => const CreateTaskScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('Маршрут ${settings.name} не найден')),
          ),
        );
    }
  }
}