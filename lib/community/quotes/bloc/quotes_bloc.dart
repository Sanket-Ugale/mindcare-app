import 'package:bloc/bloc.dart';
import 'package:mindcare/models/quotes_model.dart';
import 'package:mindcare/repositories/quotes_repo.dart';

part 'quotes_event.dart';
part 'quotes_state.dart';

class QuotesBloc extends Bloc<QuotesLoadedEvent, QuotesState> {
  final QuotesRepo quotesRepo;
  QuotesBloc(this.quotesRepo) : super(const QuotesLoadingState()) {
    on<QuotesLoadedEvent>((event, emit) async {
      try {
        emit(const QuotesLoadingState());
        var data = await quotesRepo.getQuotes();
        emit (QuotesLoadedState(data));
      } catch (e) {
        emit(QuotesErrorState('Failed to load Quotes ${e.toString()}'));        
      }
    });
  }
}

