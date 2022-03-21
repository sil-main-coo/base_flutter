import 'package:flutter/material.dart';

enum ArrowTooltipClipperDirection { UP, DOWN }

class ArrowTooltipClipper extends CustomClipper<Path> {
  final ArrowTooltipClipperDirection direction;

  ArrowTooltipClipper({required this.direction});

  @override
  Path getClip(Size size) {
    Path path = Path();

    if (direction == ArrowTooltipClipperDirection.UP) {
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
