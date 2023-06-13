import 'package:flutter/material.dart';

class CustomBodyClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    final path = Path();
    path.lineTo(0, h);
    path.lineTo(w, h);
    path.lineTo(w, 0);
    path.quadraticBezierTo(w * 0.5, h - 24, 0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
