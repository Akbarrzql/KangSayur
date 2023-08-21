import 'package:flutter_bloc/flutter_bloc.dart';
import '../../API/resource/api_repository.dart';
import 'kategori_states.dart';
import 'kategori_event.dart';

class KategoriBloc extends Bloc<KategoriEvent, KategoriState> {
  KategoriBloc() : super(KategoriInitial()) {
    final ApiRepository _apiRepository = ApiRepository();
    on<GetKategoriList>((event, emit) async {
      try {
        emit(KategoriLoading());
        final mList = await _apiRepository.getKategoriList();
        emit(KategoriLoaded(mList));
      } on NetworkError {
        emit(KategoriError("Couldn't fetch data. Is the device online?"));
      }
    });
  }

}