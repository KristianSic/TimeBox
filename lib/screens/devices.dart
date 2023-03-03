import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/box_provider.dart';
import '../widgets/square_box.dart';

class Devices extends StatelessWidget {
  const Devices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TimeBoxState>(builder: (context, state, child) {
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView.separated(
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) {
              return Center(
                child: SquareBox(
                  box: state.timeboxes[index],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 100, height: 50);
            },
            itemCount: state.count),
        floatingActionButton: FloatingActionButton(
          key: const Key('addItem_floatingActionButton'),
          onPressed: () => context.read<TimeBoxState>().addBox('new_box'),
          tooltip: 'Add Item',
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}
