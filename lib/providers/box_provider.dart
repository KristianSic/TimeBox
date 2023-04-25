import 'package:flutter/material.dart';

class Box {
  int? id;
  String name = '';

  Box(this.name);
}

class TimeBoxState with ChangeNotifier {
  final List<Box> _timeboxes = [
    //Box('Pandora'),
  ];

  int get count => _timeboxes.length;
  List<Box> get timeboxes => _timeboxes;

  void addBox(String name) {
    Box box = Box(name);
    _timeboxes.add(box);
    notifyListeners();
  }
}
