import 'dart:math';

import 'package:flutter/material.dart';



class RadialPercentWidget extends StatelessWidget {
  final Widget child;
  final double percent;
  final Color fillColor;
  final Color freeColor;
  final Color lineColor;
  final double lineWidth;
  const RadialPercentWidget({
    super.key,
    required this.child,
    required this.percent,
    required this.fillColor,
    required this.freeColor,
    required this.lineColor,
    required this.lineWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CustomPaint(painter: _RadialPercentWidget(
          fillColor: fillColor,
          percent: percent,
          lineColor: lineColor,
          freeColor: freeColor,
          lineWidth: lineWidth
        )
        ),
        Center(
          child: child,
        )
      ],
    );
  }
}

class _RadialPercentWidget extends CustomPainter {
  final double percent;
  final Color fillColor;
  final Color freeColor;
  final Color lineColor;
  final double lineWidth;

  _RadialPercentWidget({
    required this.percent,
    required this.fillColor,
    required this.freeColor,
    required this.lineColor,
    required this.lineWidth,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final arcRect = calculateArcsRect(size);
    drawBackground(canvas, size);
    drawFreeArc(canvas, arcRect);
    drawFilledArc(canvas, arcRect);
  }

  void drawFilledArc(Canvas canvas, Rect arcRect) {
    final linePaint = Paint()
      ..color = lineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = lineWidth
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(arcRect,
        -pi / 2, pi * 2 * percent, false, linePaint);
  }

  void drawFreeArc(Canvas canvas, Rect arcRect) {
    final freePaint = Paint()
      ..color = freeColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = lineWidth;
    canvas.drawArc(arcRect,
        pi * 2 * percent - pi / 2, pi * 2 * (1 - percent), false, freePaint);
  }

  void drawBackground(Canvas canvas, Size size) {
    final paint = Paint()..color = fillColor;
    canvas.drawOval(Offset.zero & Size(size.width, size.height), paint);
  }

  Rect calculateArcsRect(Size size) {
    final lineMargin = 3;
    final offset = lineWidth/2 + lineMargin;
    final arcRect = Offset(offset, offset) & Size(size.width - offset*2, size.height - offset*2);
    return arcRect;
  }

  @override
  bool shouldRepaint(_RadialPercentWidget oldDelegate) => true;
}
