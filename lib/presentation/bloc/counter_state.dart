part of 'counter_bloc.dart';

enum CounterStatus { initial, loading, success, failure }

class CounterState extends Equatable {
  final int counter;
  final CounterStatus status;

  const CounterState({
    this.counter = 0,
    this.status = CounterStatus.initial,
  });

  CounterState copyWith({
    int? counter,
    CounterStatus? status,
  }) =>
      CounterState(
        counter: counter ?? this.counter,
        status: status ?? this.status,
      );

  @override
  List<Object> get props => [counter, status];
}
