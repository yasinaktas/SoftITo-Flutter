import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, CounterState> {
  HomeBloc() : super(CounterState(counter: 0, queue: [])) {
    on<CounterIncrementPressed>(_onIncrementPressed);
    on<CounterResetPressed>(_onResetPressed);
  }

  FutureOr<void> _onIncrementPressed(
    CounterIncrementPressed event,
    Emitter<CounterState> emit,
  ) async {
    emit(state.copyWith(queue: [...state.queue, state.counter]));
    await Future.delayed(Duration(seconds: 2));
    List<int> newQueue = List.from(state.queue);
    newQueue.removeAt(0);
    emit(state.copyWith(counter: state.counter + 1, queue: newQueue));
  }

  FutureOr<void> _onResetPressed(
    CounterResetPressed event,
    Emitter<CounterState> emit,
  ) async {
    emit(CounterState(counter: 0, queue: []));
  }
}
