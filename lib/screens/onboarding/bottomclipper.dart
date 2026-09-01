import 'package:flutter/material.dart';

class BottomClipper extends CustomClipper<Path> {
  const BottomClipper();

  @override
  Path getClip(Size size) {
    const cornerCutX = 75.0;
    const cornerCutY = 20.0;


    final path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height/3*2);
    path.lineTo(size.width - cornerCutX, size.height/3*2);
    path.lineTo(size.width, size.height/3*2 + cornerCutY);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}