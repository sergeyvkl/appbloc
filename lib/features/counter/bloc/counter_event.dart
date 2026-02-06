// lib/counter_event.dart
part of 'counter_bloc.dart';

sealed class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class IncrementCounter extends CounterEvent {
  const IncrementCounter();
}

class DecrementCounter extends CounterEvent {
  const DecrementCounter();
}

class ResetCounter extends CounterEvent {
  const ResetCounter();
}