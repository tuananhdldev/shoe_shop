import 'package:flutter/material.dart';
import 'dart:math' as math;
class BackgroundCurvePainter extends CustomPainter {
  static const _radiusTop = 50.0;
  static const _radiusBottom = 30.0;
  static const _horizontalControlTop = 0.6;
  static const _horizontalControlBottom = 0.5;
  static const _pointControlTop = 0.35;
  static const _pointControlBottom = 0.85;
  static const _topY = -60.0;
  static const _bottomY = 0.0;
  static const _topDistance = 0.0;
  static const _bottomDistance = 10.0;

  late final double _x;
  late final double _normalizedY;
  late final Color _color;

  BackgroundCurvePainter(this._x, this._normalizedY, this._color);

  @override
  void paint(Canvas canvas, Size size) {
    final norm = const LinearPointCurve(0.5, 2.0).transform(_normalizedY)/5;
    final radius =
    Tween<double>(begin: _radiusTop, end: _radiusBottom).transform(norm);
    // Point colinear to the top edge of the background pane
    final anchorControlOffset = Tween<double>(
        begin: radius * _horizontalControlTop,
        end: radius * _horizontalControlBottom)
        .transform(const LinearPointCurve(0.5, 0.75).transform(norm));
    // Point that slides up and down depending on distance for the target x position
    final dipControlOffset = Tween<double>(
        begin: radius * _pointControlTop, end: radius * _pointControlBottom)
        .transform(const LinearPointCurve(0.5, 0.8).transform(norm));
    final y = Tween<double>(begin: _topY, end: _bottomY)
        .transform(const LinearPointCurve(0.2, 0.7).transform(norm));
    final dist = Tween<double>(begin: _topDistance, end: _bottomDistance)
        .transform(const LinearPointCurve(0.5, 0.0).transform(norm));
    final x0 = _x - dist / 2;
    final x1 = _x + dist / 2;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(x0 - radius, 0)
      ..cubicTo(
          x0 - radius + anchorControlOffset, 0, x0 - dipControlOffset, y, x0, y)
      ..lineTo(x1, y)
      ..cubicTo(x1 + dipControlOffset, y, x1 + radius - anchorControlOffset, 0,
          x1 + radius, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);

    final paint = Paint()..color = _color;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(BackgroundCurvePainter oldPainter) {
    return _x != oldPainter._x ||
        _normalizedY != oldPainter._normalizedY ||
        _color != oldPainter._color;
  }


}

class LinearPointCurve extends Curve {
  final double pIn;
  final double pOut;

  const LinearPointCurve(this.pIn, this.pOut);

  @override
  double transform(double t) {
    final lowerScale = pOut / pIn;
    final upperScale = (1 - pOut) / (1 - pIn);
    final upperOffset = 1.0 - upperScale;

    return t < pIn ? t * lowerScale : t * upperScale + upperOffset;
  }

}
class CenteredElasticOutCurve extends Curve {
  final double period;

  CenteredElasticOutCurve([this.period = 0.4]);

  @override
  double transform(double x) {
    // Bascially just a slightly modified version of the built in ElasticOutCurve
    return math.pow(2.0, -10.0 * x) * math.sin(x * 2.0 * math.pi / period) +
        0.5;
  }
}

class CenteredElasticInCurve extends Curve {
  final double period;

  CenteredElasticInCurve([this.period = 0.4]);

  @override
  double transform(double x) {
    // Bascially just a slightly modified version of the built in ElasticInCurve
    return -math.pow(2.0, 10.0 * (x - 1.0)) *
        math.sin((x - 1.0) * 2.0 * math.pi / period) +
        0.5;
  }
}
