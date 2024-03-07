import 'package:flutter/material.dart';

class Tree extends StatelessWidget {
  const Tree({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(height: 23),
        Positioned(
          left: 16,
          child: Container(
            width: 1,
            height: 23,
            color: Colors.grey,
          ),
        ),
        Positioned(
          left: 12.5,
          top: 7,
          child: Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ],
    );
  }
}
