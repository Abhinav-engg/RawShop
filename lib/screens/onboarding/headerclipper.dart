import 'package:flutter/material.dart';
import 'bottomclipper.dart';

class HeaderClipper extends CustomClipper<Path> {
  const HeaderClipper();

  @override
  Path getClip(Size size) {
    const cornerCutXTop = 90.0;
    const cornerCutYTop = 30.0;
    const cornerCutX = 75.0;
    const cornerCutY = 15.0;

    const slantHeight = 50.0;

    final path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width - cornerCutXTop, 0);
    path.lineTo(size.width, cornerCutYTop);
    path.lineTo(size.width, size.height/3*2);
    path.lineTo(size.width - cornerCutX, size.height/3*2);
    path.lineTo(0, size.height/3*2 - cornerCutY/cornerCutX*(size.height/3*2-cornerCutX));
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant HeaderClipper oldClipper) => false;
}