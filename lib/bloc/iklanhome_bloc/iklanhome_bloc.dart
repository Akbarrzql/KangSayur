import 'package:flutter_bloc/flutter_bloc.dart';
import '../../API/resource/api_repository.dart';
import 'iklanhome_event.dart';
import 'iklanhome_states.dart';

class IklanHomeBloc extends Bloc<IklanHomeEvent, IklanHomeState> {
  IklanHomeBloc() : super(IklanHomeInitial()) {
    final ApiRepository _apiRepository = ApiRepository();
    on<GetIklanHomeList>((event, emit) async {
      try {
        emit(IklanHomeLoading());
        final mList = await _apiRepository.getIklanHomeList();
        emit(IklanHomeLoaded(mList));
      } on NetworkError {
        emit(IklanHomeError("Couldn't fetch data. Is the device online?"));
      }
    });
  }

}