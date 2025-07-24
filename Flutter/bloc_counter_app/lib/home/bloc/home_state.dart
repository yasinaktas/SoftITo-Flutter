part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class CounterState extends HomeInitial {
  final int counter;
  final List<int> queue;

  CounterState({required this.counter, required this.queue});

  CounterState copyWith({
    int? counter,
    List<int>? queue,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
      queue: queue ?? this.queue,
    );
  }
}
