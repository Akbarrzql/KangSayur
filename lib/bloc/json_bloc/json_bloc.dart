import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:kangsayur/bloc/json_bloc/json_event.dart';
import 'package:kangsayur/bloc/json_bloc/json_state.dart';

import '../../API/resource/api_repository.dart';

class JsonBloc extends Bloc<JsonEvent, JsonState> {
  JsonBloc() : super(JsonInitial()) {
    final ApiRepository _apiRepository = ApiRepository();

    on<GetProfileList>((event, emit) async {
      try {
        emit(JsonLoading());
        final jsonProfile = await _apiRepository.getProfileList();
        emit(JsonLoaded(jsonProfile, null, null, null, null, null));
      } on NetworkError {
        emit(JsonError("Couldn't fetch data. Is the device online?"));
      }
    });
    on<GetProductMostPopularList>((event, emit) async {
      try {
        emit(JsonLoading());
        final mList = await _apiRepository.getProductMostPopularList();
        emit(JsonLoaded(null, mList, null, null, null, null));
      } on NetworkError {
        emit(JsonError("Couldn't fetch data. Is the device online?"));
      }
    });
    on<GetProductUserMostVisitList>((event, emit) async {
      try {
        emit(JsonLoading());
        final mList = await _apiRepository.getProductUserMostVisitList();
        emit(JsonLoaded(null, null, mList, null, null, null));
      } on NetworkError {
        emit(JsonError("Couldn't fetch data. Is the device online?"));
      }
    });
    on<GetNearestTokoList>((event, emit) async {
      try {
        emit(JsonLoading());
        final mList = await _apiRepository.getNearestTokoList();
        emit(JsonLoaded(null, null, null, mList,null, null));
      } on NetworkError {
        emit(JsonError("Couldn't fetch data. Is the device online?"));
      }
    });
    on<GetDetailProductList>((event, emit) async {
      try {
        emit(JsonLoading());
        final mList = await _apiRepository.getDetailProductList(event.id);
        emit(JsonLoaded(null, null, null, null,mList, null));
      } on NetworkError {
        emit(JsonError("Couldn't fetch data. Is the device online?"));
      }
    });
    on<GetSearchProductList>((event, emit) async {
      try {
        emit(JsonLoading());
        final mList = await _apiRepository.getSearchProductList(event.keyword);
        emit(JsonLoaded(null, null, null, null,null,mList));
      } on NetworkError {
        emit(JsonError("Couldn't fetch data. Is the device online?"));
      }
    });

  }
}
