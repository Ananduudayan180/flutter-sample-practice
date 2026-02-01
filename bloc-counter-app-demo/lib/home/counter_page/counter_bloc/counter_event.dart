part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}

class IncrementRequestEvent extends CounterEvent{}

class DecrementRequestEvent extends CounterEvent{}
