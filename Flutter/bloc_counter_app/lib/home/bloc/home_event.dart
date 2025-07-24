part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class CounterIncrementPressed extends HomeEvent {
  CounterIncrementPressed();
}

class CounterResetPressed extends HomeEvent {}
