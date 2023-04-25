import 'package:flutter/material.dart';

class ProfileState with ChangeNotifier {
  int _count = 0;
  String _username = '';
  String _email = '';
  bool _hasAvatar = false;

  int get count => _count;
  String get username => _username;
  String get email => _email;
  bool get hasAvatar => _hasAvatar;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }

  void reset() {
    _count = 0;
    notifyListeners();
  }

  void setUsername(username) {
    _username = username;
    notifyListeners();
  }

  void setAvatar() {
    _hasAvatar = true;
    notifyListeners();
  }

  void setEmail(email) {
    _email = email;
    notifyListeners();
  }
}
