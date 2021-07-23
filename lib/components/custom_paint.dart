import 'package:flutter/material.dart';


const int _DefaultDashes = 20;
const Color _DefaultColor = Color(0);
const double _DefaultGapSize = 3.0;
const double _DefaultStrokeWidth = 2.5;
const double pi = 3.1415926535897932;


class DashedCircle extends StatelessWidget {
  final int dashes;
  final Color color;
  final double gapSize;
  final double strokeWidth;
  final Widget child;

  DashedCircle(
      {this.child,
        this.dashes = _DefaultDashes,
        this.color = _DefaultColor,
        this.gapSize = _DefaultGapSize,
        this.strokeWidth = _DefaultStrokeWidth});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DashedCirclePainter(
          dashes: dashes,
          color: color,
          gapSize: gapSize,
          strokeWidth: strokeWidth),
      child: child,
    );
  }
}

class DashedCirclePainter extends CustomPainter {
  final int dashes;
  final Color color;
  final double gapSize;
  final double strokeWidth;

  DashedCirclePainter(
      {this.dashes = _DefaultDashes,
        this.color = _DefaultColor,
        this.gapSize = _DefaultGapSize,
        this.strokeWidth = _DefaultStrokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final double gap = pi / 180 * gapSize;
    final double singleAngle = (pi * 2) / dashes;

    for (int i = 0; i < dashes; i++) {
      final Paint paint = Paint()
        ..color = color
        ..strokeWidth = _DefaultStrokeWidth
        ..style = PaintingStyle.stroke;

      canvas.drawArc(Offset.zero & size, gap + singleAngle * i,
          singleAngle - gap * 2, false, paint);
    }
  }

  @override
  bool shouldRepaint(DashedCirclePainter oldDelegate) {
    return dashes != oldDelegate.dashes || color != oldDelegate.color;
  }
}

class MyCircle extends StatelessWidget{
  final Color backgroundColor;
  final double centerX, centerY, radius;
  final Widget child;

  MyCircle({this.backgroundColor, this.centerX, this.centerY, this.radius, this.child});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomPaint(
        painter: CirclePainter(
          centerY: centerY,
          centerX: centerX,
          backgroundColor: backgroundColor,
          radius: radius,

      ),
      child: child,
    );
  }
}

class CirclePainter extends CustomPainter {

  final Color backgroundColor;
  final double centerX, centerY, radius;


  CirclePainter({Key key, this.backgroundColor, this.centerX, this.centerY, this.radius});

  @override
  void paint(Canvas canvas, Size size) {
    Paint brush = Paint()
        ..color = backgroundColor
        ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(centerX, centerY), radius, brush);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }


}