import 'package:flutter/material.dart';

class ProfileState with ChangeNotifier {
  int _count = 0;
  String _name = 'Kristian';
  bool _hasAvatar = false;

  int get count => _count;
  String get name => _name;
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

  void setName(name) {
    _name = name;
    notifyListeners();
  }

  void setAvatar() {
    _hasAvatar = true;
    notifyListeners();
  }
}
