import 'package:flutter/material.dart';

class TrianglePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final paintOrange = Paint()..color = Colors.orange;

    final pathOrange = Path();
    pathOrange.lineTo(0, size.height);
    pathOrange.lineTo(size.width, 0);
    pathOrange.close();


    canvas.drawPath(pathOrange, paintOrange);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}