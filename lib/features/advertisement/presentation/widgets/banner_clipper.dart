import 'package:flutter/material.dart';

class BannerClipper extends CustomClipper<Path> {
  final bool isArabic;

  BannerClipper({required this.isArabic});

  @override
  Path getClip(Size size) {
    Path path = Path();
    if (isArabic) {
      path.moveTo(size.width, 0);
      path.lineTo(size.width * 0.10, 0);
      path.quadraticBezierTo(
          0, size.height * 0.5, size.width * 0.10, size.height);
      path.lineTo(size.width, size.height);
      path.lineTo(size.width, 0);
    } else {
      path.lineTo(size.width * 0.90, 0);
      path.quadraticBezierTo(
          size.width, size.height * 0.5, size.width * 0.90, size.height);
      path.lineTo(0, size.height);
      path.lineTo(0, 0);
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}