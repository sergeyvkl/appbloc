// lib/counter2_bloc.dart
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter2_event.dart';
part 'counter2_state.dart';

class Counter2Bloc extends Bloc<Counter2Event, Counter2State> {
  Counter2Bloc() : super(const Counter2State()) {
    on<IncrementCounter2>(_onIncrement);
    on<DecrementCounter2>(_onDecrement);
    on<ResetCounter2>(_onReset);
    on<SetValueCounter2>(_onSetValue);
  }

  void _onIncrement(IncrementCounter2 event, Emitter<Counter2State> emit) {
    emit(state.copyWith(count: state.count + 1));
  }

  void _onDecrement(DecrementCounter2 event, Emitter<Counter2State> emit) {
    emit(state.copyWith(count: state.count - 1));
  }

  void _onReset(ResetCounter2 event, Emitter<Counter2State> emit) {
    emit(state.copyWith(count: 0));
  }

  void _onSetValue(SetValueCounter2 event, Emitter<Counter2State> emit) {
    emit(state.copyWith(count: event.value));
  }
}