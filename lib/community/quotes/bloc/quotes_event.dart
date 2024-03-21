part of 'quotes_bloc.dart';

// @immutable
sealed class QuotesEvent {
  const QuotesEvent();

  // @override
  List<Object> get props => [];
}
class QuotesLoadedEvent {
  const QuotesLoadedEvent();
}