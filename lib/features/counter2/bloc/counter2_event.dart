// lib/counter2_event.dart
part of 'counter2_bloc.dart';

sealed class Counter2Event extends Equatable {
  const Counter2Event();

  @override
  List<Object> get props => [];
}

class IncrementCounter2 extends Counter2Event {
  const IncrementCounter2();
}

class DecrementCounter2 extends Counter2Event {
  const DecrementCounter2();
}

class ResetCounter2 extends Counter2Event {
  const ResetCounter2();
}

class SetValueCounter2 extends Counter2Event {
  final int value;

  const SetValueCounter2(this.value);

  @override
  List<Object> get props => [value];
}