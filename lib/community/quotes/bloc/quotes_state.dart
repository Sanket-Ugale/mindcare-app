part of 'quotes_bloc.dart';

// @immutable
sealed class QuotesState {
  const QuotesState();
  List<Object> get props => [];
}

final class QuotesInitial extends QuotesState {}

class QuotesLoadingState extends QuotesState {
  const QuotesLoadingState();
}

class QuotesLoadedState extends QuotesState {
  final List<QuotesModel> quotes;
  const QuotesLoadedState(this.quotes);
  @override
  List<Object> get props => [];
}

class QuotesErrorState extends QuotesState {
  final String errorMessage;
  const QuotesErrorState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}


