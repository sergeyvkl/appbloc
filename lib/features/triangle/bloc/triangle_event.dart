// lib/triangle_event.dart
part of 'triangle_bloc.dart';

sealed class TriangleEvent extends Equatable {
  const TriangleEvent();

  @override
  List<Object> get props => [];
}

class ToggleTriangle extends TriangleEvent {
  const ToggleTriangle();
}

class ResetTriangle extends TriangleEvent {
  const ResetTriangle();
}