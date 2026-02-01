part of 'counter_bloc.dart';

class CounterState {
  int count;
  CounterState({required this.count});
}

final class CounterInitial extends CounterState {
  CounterInitial() : super(count: 0);
}

final class IncrementState extends CounterState {
  IncrementState({required super.count});
}

final class DecrementState extends CounterState {
  DecrementState({required super.count});
}
