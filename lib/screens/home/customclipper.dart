import 'package:flutter/material.dart';

class CustomClipperWidget extends CustomClipper<Path>{
  const CustomClipperWidget();

  @override
  Path getClip(Size size){


    final path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, 100);
    path.lineTo(0, size.height/3);
    path.close();

    return path;

  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }

}