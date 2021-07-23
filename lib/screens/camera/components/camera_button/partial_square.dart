import 'package:bar_code_reader/screens/camera/components/camera_button/partial_painter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PartialBorderContainer extends StatelessWidget {
  PartialBorderContainer({
    @required gradient,
    @required this.child,
    @required this.onPressed,
    this.strokeWidth = 4,
    this.padding = 16,
    splashColor,
  }) :
        this.painter = PartialPainter(
            strokeWidth: strokeWidth, gradient: gradient

        ),
        this.splashColor = splashColor ?? gradient.colors.first;
  final PartialPainter painter;
  final Widget child;
  final VoidCallback onPressed;
  final double strokeWidth;
  final double padding;
  final Color splashColor;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: painter,
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: splashColor,
        onTap: onPressed,
        child: Container(
            padding: EdgeInsets.all(padding + strokeWidth),
            child: child,

        ),
      ),
    );
  }
}