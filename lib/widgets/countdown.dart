import 'dart:async';

import 'package:flutter/material.dart';

class Countdown extends StatefulWidget {
  final int startTime;

  const Countdown({Key? key, required this.startTime}) : super(key: key);

  @override
  State<Countdown> createState() => CountdownState();
}

class CountdownState extends State<Countdown> {
  late int _currentTime;

  @override
  void initState() {
    super.initState();
    _currentTime = widget.startTime;
    //startTimer();
  }

  void startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _currentTime--;
        if (_currentTime == 0) {
          _currentTime = widget.startTime;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    String timeString = _currentTime.toString().padLeft(2, '0');
    return Text(
      '0:00:$timeString',
      style: const TextStyle(
          color: Colors.black, fontSize: 25, fontFamily: 'Monocraft'),
    );
  }
}
