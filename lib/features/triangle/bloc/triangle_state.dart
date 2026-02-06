// lib/triangle_state.dart
part of 'triangle_bloc.dart';

class TriangleState extends Equatable {
  final double angle;
  final Color color;
  final int clickCount;

  const TriangleState({
    this.angle = 0,
    this.color = Colors.red,
    this.clickCount = 0,
  });

  TriangleState copyWith({
    double? angle,
    Color? color,
    int? clickCount,
  }) {
    return TriangleState(
      angle: angle ?? this.angle,
      color: color ?? this.color,
      clickCount: clickCount ?? this.clickCount,
    );
  }

  @override
  List<Object> get props => [angle, color.value, clickCount];
}