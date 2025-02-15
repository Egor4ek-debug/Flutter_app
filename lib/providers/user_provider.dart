import 'package:flutter/material.dart';
import 'package:task_manager/models/app_user.dart';

class UserProvider with ChangeNotifier {
  AppUser? _user;

  AppUser? get user => _user;

  void setUser(AppUser user) {
    _user = user;
    notifyListeners();
  }

  void clearUser() {
    _user = null;
    notifyListeners();
  }
}