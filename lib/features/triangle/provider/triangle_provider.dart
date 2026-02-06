// lib/triangle_provider.dart
import 'package:flutter/material.dart';

class TriangleProvider extends ChangeNotifier {
  double _angle = 0;
  Color _color = Colors.red;
  int _clickCount = 0;

  double get angle => _angle;
  Color get color => _color;
  int get clickCount => _clickCount;

  void toggle() {
    _angle = (_angle + 90) % 360;
    _color = _color == Colors.red ? Colors.green : Colors.red;
    _clickCount++;
    notifyListeners();
  }

  void reset() {
    _angle = 0;
    _color = Colors.red;
    _clickCount = 0;
    notifyListeners();
  }

  void setAngle(double newAngle) {
    _angle = newAngle % 360;
    notifyListeners();
  }

  void setColor(Color newColor) {
    _color = newColor;
    notifyListeners();
  }
}