import 'package:flutter_bloc/flutter_bloc.dart';
import '../../API/resource/api_repository.dart';
import 'alamat_event.dart';
import 'alamat_state.dart';

class AlamatBloc extends Bloc<AlamatEvent, AlamatState> {
  AlamatBloc() : super(AlamatInitial()) {
    final ApiRepository _apiRepository = ApiRepository();
    on<GetAlamatList>((event, emit) async {
      try {
        emit(AlamatLoading());
        final mList = await _apiRepository.getAlamatList();
        emit(AlamatLoaded(mList));
      } on NetworkError {
        emit(AlamatError("Couldn't fetch data. Is the device online?"));
      }
    });
  }

}