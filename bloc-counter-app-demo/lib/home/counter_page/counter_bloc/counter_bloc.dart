import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<IncrementRequestEvent>((event, emit) {
      int increment = state.count;
      int incrementedCount = increment+1;
      emit(IncrementState(count: incrementedCount));
    });

    on<DecrementRequestEvent>((event, emit) {
      int decrement = state.count;
      final int decrementedCount = decrement-1;
      emit(DecrementState(count: decrementedCount));
    });
  }
}
