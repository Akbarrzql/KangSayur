import 'package:flutter_bloc/flutter_bloc.dart';
import '../../API/resource/api_repository.dart';
import 'iklan_event.dart';
import 'iklan_state.dart';

class IklanBloc extends Bloc<IklanEvent, IklanState> {
  IklanBloc() : super(IklanInitial()) {
    final ApiRepository _apiRepository = ApiRepository();
    on<GetIklanList>((event, emit) async {
      try {
        emit(IklanLoading());
        final mList = await _apiRepository.getIklanList();
        emit(IklanLoaded(mList));
      } on NetworkError {
        emit(IklanError("Couldn't fetch data. Is the device online?"));
      }
    });
  }

}