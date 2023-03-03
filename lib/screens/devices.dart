import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/shopping_cart_provider.dart';

class Devices extends StatelessWidget {
  const Devices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TimeBoxState>(builder: (context, state, child) {
      return Scaffold(
        body: Center(
          child: Column(
            children: [
              ListView.builder(
                  itemCount: state.count,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Title: ${state.timeboxes[index]}"),
                    );
                  }),
            ],
          ),
        ),
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
