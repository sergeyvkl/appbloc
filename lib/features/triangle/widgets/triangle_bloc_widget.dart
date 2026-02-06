// Кастомный виджет треугольника
import 'dart:math';

import 'package:flutter/material.dart';

class TriangleBlocWidget extends StatelessWidget {
  final Color color;
  final double angle;
  final VoidCallback onTap;

  const TriangleBlocWidget({
    super.key,
    required this.color,
    required this.angle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        transform: Matrix4.rotationZ(angle * pi / 180),
        transformAlignment: Alignment.center,
        child: CustomPaint(
          size: const Size(150, 150),
          painter: TrianglePainter(color: color),
        ),
      ),
    );
  }
}

// Кастомный painter для рисования треугольника
class TrianglePainter extends CustomPainter {
  final Color color;

  TrianglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 3;

    final shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.3)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);

    // Координаты треугольника
    final path = Path()
      ..moveTo(size.width / 2, 0) // верхняя точка
      ..lineTo(size.width, size.height) // правая нижняя точка
      ..lineTo(0, size.height) // левая нижняя точка
      ..close();

    // Рисуем тень
    canvas.drawPath(path, shadowPaint);
    
    // Рисуем основной треугольник
    canvas.drawPath(path, paint);

    // Рисуем обводку
    final borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}