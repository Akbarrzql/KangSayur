import 'package:flutter_bloc/flutter_bloc.dart';
import '../../API/resource/api_repository.dart';
import 'notifikasilist_event.dart';
import 'notifikasilist_state.dart';

class NotifikasiListBloc extends Bloc<NotifikasiListEvent, NotifikasiListState> {
  NotifikasiListBloc() : super(NotifikasiListInitial()) {
    final ApiRepository _apiRepository = ApiRepository();
    on<GetNotifikasiListList>((event, emit) async {
      try {
        emit(NotifikasiListLoading());
        final mList = await _apiRepository.getNotifikasiListList();
        emit(NotifikasiListLoaded(mList));
      } on NetworkError {
        emit(NotifikasiListError("Couldn't fetch data. Is the device online?"));
      }
    });
  }

}