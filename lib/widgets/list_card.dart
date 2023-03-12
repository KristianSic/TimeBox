import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MyListWidget extends StatelessWidget {
  final String title;
  final String time;
  final void Function() onDelete;
  final void Function() onShare;

  const MyListWidget(
      {super.key,
      required this.title,
      required this.time,
      required this.onDelete,
      required this.onShare});
  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(
          onDismissed: () {},
          confirmDismiss: () {
            return Future(() => false);
          },
        ),
        children: [
          SlidableAction(
            onPressed: (c) {
              onShare();
            },
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            icon: Icons.share,
          ),
          SlidableAction(
            onPressed: (c) {
              onDelete();
            },
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            icon: Icons.delete,
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffD9D9D9),
            borderRadius: BorderRadius.circular(5.0),
          ),
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.black),
              ),
              Text(
                time,
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
