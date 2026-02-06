// lib/triangle_widget.dart
import 'dart:math';
import 'package:flutter/material.dart';

class TriangleProviderWidget extends StatelessWidget {
  final Color color;
  final double angle;
  final VoidCallback onTap;
  final String label;

  const TriangleProviderWidget({
    super.key,
    required this.color,
    required this.angle,
    required this.onTap,
    this.label = '',
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          if (label.isNotEmpty) ...[
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 10),
          ],
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            transform: Matrix4.rotationZ(angle * pi / 180),
            transformAlignment: Alignment.center,
            child: Stack(
              children: [
                // Тень
                CustomPaint(
                  size: const Size(120, 120),
                  painter: _TrianglePainter(
                    color: Colors.black.withOpacity(0.3),
                    strokeWidth: 0,
                  ),
                ),
                // Основной треугольник
                CustomPaint(
                  size: const Size(120, 120),
                  painter: _TrianglePainter(
                    color: color,
                    strokeWidth: 3,
                    strokeColor: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TrianglePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final Color strokeColor;

  _TrianglePainter({
    required this.color,
    this.strokeWidth = 0,
    this.strokeColor = Colors.transparent,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = strokeWidth > 0 ? PaintingStyle.stroke : PaintingStyle.fill
      ..strokeWidth = strokeWidth;

    if (strokeWidth > 0) {
      paint.color = strokeColor;
      final fillPaint = Paint()
        ..color = color
        ..style = PaintingStyle.fill;
      _drawTriangle(canvas, size, fillPaint);
    }

    _drawTriangle(canvas, size, paint);
  }

  void _drawTriangle(Canvas canvas, Size size, Paint paint) {
    final path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}