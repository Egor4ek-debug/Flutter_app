import 'package:flutter/material.dart';

class EmployeeHome extends StatelessWidget {
  const EmployeeHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Домашняя страница сотрудника')),
      body: const Center(
        child: Text('Добро пожаловать, сотрудник!'),
      ),
    );
  }
}
