// lib/counter2_state.dart
part of 'counter2_bloc.dart';

class Counter2State extends Equatable {
  final int count;

  const Counter2State({
    this.count = 0,
  });

  Counter2State copyWith({
    int? count,
  }) {
    return Counter2State(
      count: count ?? this.count,
    );
  }

  @override
  List<Object> get props => [count];
}