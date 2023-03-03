import 'package:flutter/material.dart';
import '../providers/box_provider.dart';

class SquareBox extends StatelessWidget {
  final Box box;

  const SquareBox({
    Key? key,
    required this.box,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            'https://via.placeholder.com/100',
            height: 100,
            width: 100,
          ),
          const SizedBox(height: 10),
          Text(
            box.name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
