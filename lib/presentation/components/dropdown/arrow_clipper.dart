import 'package:flutter/material.dart';

enum ArrowClipperDirection { UP, DOWN }

class ArrowClipper extends CustomClipper<Path> {
  final ArrowClipperDirection direction;

  ArrowClipper({required this.direction});

  @override
  Path getClip(Size size) {
    Path path = Path();

    if (direction == ArrowClipperDirection.UP) {
      path.moveTo(0, size.height);
      path.lineTo(size.width / 2, size.height / 2);
      path.lineTo(size.width, size.height);
      return path;
    }

    path.moveTo(0, 0);
    path.lineTo(size.width / 2, size.height / 2);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
