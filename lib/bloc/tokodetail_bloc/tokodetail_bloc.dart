import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kangsayur/bloc/tokodetail_bloc/tokodetail_event.dart';
import 'package:kangsayur/bloc/tokodetail_bloc/tokodetail_state.dart';

import '../../API/resource/api_repository.dart';

class TokoDetailBloc extends Bloc<TokoDetailEvent, TokoDetailState> {
  TokoDetailBloc() : super(TokoDetailInitial()) {
    final ApiRepository _apiRepository = ApiRepository();
    on<GetTokoDetailList>((event, emit) async {
      try {
        emit(TokoDetailLoading());
        final mList = await _apiRepository.getTokoDetailList(event.id);
        emit(TokoDetailLoaded(mList));
      } on NetworkError {
        emit(TokoDetailError("Couldn't fetch data. Is the device online?"));
      }
    });
  }

}