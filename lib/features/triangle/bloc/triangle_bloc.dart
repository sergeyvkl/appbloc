// lib/triangle_bloc.dart
import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'triangle_event.dart';
part 'triangle_state.dart';

class TriangleBloc extends Bloc<TriangleEvent, TriangleState> {
  TriangleBloc() : super(const TriangleState()) {
    on<ToggleTriangle>(_onToggleTriangle);
    on<ResetTriangle>(_onResetTriangle);
  }

  void _onToggleTriangle(ToggleTriangle event, Emitter<TriangleState> emit) {
    final newAngle = (state.angle + 90) % 360;
    final newColor = state.color == Colors.red ? Colors.green : Colors.red;
    
    emit(state.copyWith(
      angle: newAngle,
      color: newColor,
      clickCount: state.clickCount + 1,
    ));
  }

  void _onResetTriangle(ResetTriangle event, Emitter<TriangleState> emit) {
    emit(const TriangleState());
  }
}