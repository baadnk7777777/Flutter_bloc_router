import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<IncrementEvent>(_onCounterIncrementd);
  }

  Future<void> _onCounterIncrementd(
    IncrementEvent event,
    Emitter<CounterState> emit,
  ) async {
    emit(state.copyWith(status: CounterStatus.loading));
    await Future.delayed(const Duration(seconds: 1));
    emit(
      state.copyWith(status: CounterStatus.success, counter: state.counter + 1),
    );
  }
}
