import 'package:flutter/material.dart';

class TimeBoxState with ChangeNotifier {
  final List<String> _timeboxes = ['PhoneBox', 'VapeBox', 'CardBox'];

  int get count => _timeboxes.length;
  List<String> get timeboxes => _timeboxes;

  void addBox(String timebox) {
    _timeboxes.add(timebox);
    notifyListeners();
  }
}
