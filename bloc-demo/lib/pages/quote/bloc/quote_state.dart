part of 'quote_bloc.dart';

@immutable
sealed class QuoteState {}

final class QuoteInitial extends QuoteState {}

class QuoteLoadingState extends QuoteState {}

class QuoteLoadedState extends QuoteState {
  final String quote;

  QuoteLoadedState({required this.quote});
}

class QuoteErrorState extends QuoteState {
  final String errorMsg;

  QuoteErrorState({required this.errorMsg});
}
