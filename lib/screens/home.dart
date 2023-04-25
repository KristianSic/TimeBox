import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timebox/widgets/countdown.dart';

import '../providers/box_provider.dart';
import '../widgets/square_box.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TimeBoxState>(builder: (context, state, child) {
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Column(children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xffD9D9D9),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  state.timeboxes.isNotEmpty
                      ? SquareBox(
                          box: state.timeboxes[0],
                        )
                      : const Text("empty"),
                  Container(
                      padding: const EdgeInsets.only(right: 10),
                      child: const Countdown(startTime: 20))
                ],
              ),
            ),
          ]),
        ),
      );
    });
  }
}
