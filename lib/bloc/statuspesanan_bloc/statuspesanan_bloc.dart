

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kangsayur/bloc/statuspesanan_bloc/statuspesanan_event.dart';
import 'package:kangsayur/bloc/statuspesanan_bloc/statuspesanan_state.dart';

import '../../API/resource/api_repository.dart';

class StatusPesananBloc extends Bloc<StatusPesananEvent, StatusPesananState> {
  StatusPesananBloc() : super(StatusPesananInitial()) {
    final ApiRepository _apiRepository = ApiRepository();
    on<GetStatusPesananAllList>((event, emit) async {
      try {
        emit(StatusPesananLoading());
        final mList = await _apiRepository.getStatusPesananAllList();
        emit(StatusPesananLoaded(mList, mList));
      } on NetworkError {
        emit(StatusPesananError("Couldn't fetch data. Is the device online?"));
      }
    });
    on <GetStatusPesananSelesaiList>((event, emit) async {
      try {
        emit(StatusPesananLoading());
        final mList = await _apiRepository.getStatusPesananSelesaiList();
        emit(StatusPesananLoaded(mList, mList));
      } on NetworkError {
        emit(StatusPesananError("Couldn't fetch data. Is the device online?"));
      }
    });
  }

}