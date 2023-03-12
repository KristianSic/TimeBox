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
        color: const Color(0xffC4C4C4),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(0.0),
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              color: const Color(0xff9E9E9E),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.square_rounded,
              color: Colors.black,
              size: 150,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            box.name,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
