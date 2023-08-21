import 'package:flutter_bloc/flutter_bloc.dart';
import '../../API/resource/api_repository.dart';
import 'historyreview_event.dart';
import 'historyreview_states.dart';
class HistoryReviewBloc extends Bloc<HistoryReviewEvent, HistoryReviewState> {
  HistoryReviewBloc() : super(HistoryReviewInitial()) {
    final ApiRepository _apiRepository = ApiRepository();
    on<GetHistoryReviewList>((event, emit) async {
      try {
        emit(HistoryReviewLoading());
        final mList = await _apiRepository.getHistoryReviewList();
        emit(HistoryReviewLoaded(mList));
      } on NetworkError {
        emit(HistoryReviewError("Couldn't fetch data. Is the device online?"));
      }
    });
  }

}