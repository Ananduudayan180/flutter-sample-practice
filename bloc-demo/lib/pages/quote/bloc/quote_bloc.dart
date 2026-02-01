import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'quote_event.dart';
part 'quote_state.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  QuoteBloc() : super(QuoteInitial()) {
    on<QuoteRequestEvent>((event, emit) async {
      emit(QuoteLoadingState());

      await Future.delayed(const Duration(seconds: 2), () {
        emit(
          QuoteLoadedState(
            quote: "The only way to do great work is to love what you do.",
          ),
        );
      });
    });
  }
}
