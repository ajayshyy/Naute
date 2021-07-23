import 'package:flutter/cupertino.dart';

class PartialPainter extends CustomPainter {
  PartialPainter({this.radius, this.strokeWidth, this.gradient});
  final Paint paintObject = Paint();
  final double radius;
  final double strokeWidth;
  final Gradient gradient;

  @override
  void paint(Canvas canvas, Size size) {
    Rect topLeftTop = Rect.fromLTRB(0, 0, size.height / 4, strokeWidth);
    Rect topLeftLeft = Rect.fromLTRB(0, 0, strokeWidth, size.height / 4);

    Rect bottomRightBottom = Rect.fromLTRB(size.width - size.height / 4, size.height - strokeWidth, size.width, size.height);
    Rect bottomRightRight = Rect.fromLTRB(size.width - strokeWidth, size.height * 3 / 4, size.width, size.height);

    Rect topRightTop = Rect.fromLTRB(size.width, 0 ,size.width - size.height / 4, strokeWidth);
    Rect topRightRight = Rect.fromLTRB(size.width, 0 , size.width - strokeWidth, size.height / 4);

    Rect bottomRightBot = Rect.fromLTRB(0, size.height ,size.height / 4, size.height - strokeWidth);
    Rect bottoRightRight = Rect.fromLTRB(0,size.height,strokeWidth,size.height * 3 / 4);

    paintObject.shader = gradient.createShader(Offset.zero & size);
    Path topLeftPath = Path()
      ..addRect(topLeftTop)
      ..addRect(topLeftLeft);
    Path topRightPath = Path()
      ..addRect(topRightTop)
      ..addRect(topRightRight);
    Path bottomRightPath = Path()
      ..addRect(bottomRightBottom)
      ..addRect(bottomRightRight);
    Path bottomLeftPath = Path()
      ..addRect(bottomRightBot)
      ..addRect(bottoRightRight);
    Path finalPath = Path.combine(PathOperation.union, topLeftPath, bottomRightPath);
    Path other = Path.combine(PathOperation.union, finalPath, topRightPath);
    Path other1 = Path.combine(PathOperation.union, other, bottomLeftPath);

    canvas.drawPath(other1, paintObject);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}