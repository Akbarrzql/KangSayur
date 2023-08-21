import 'package:flutter_bloc/flutter_bloc.dart';
import '../../API/resource/api_repository.dart';
import 'produkterlaris_states.dart';
import 'produkterlaris_event.dart';
class ProdukTerlarisBloc extends Bloc<ProdukTerlarisEvent, ProdukTerlarisState> {
  ProdukTerlarisBloc() : super(ProdukTerlarisInitial()) {
    final ApiRepository _apiRepository = ApiRepository();
    on<GetProdukTerlarisList>((event, emit) async {
      try {
        emit(ProdukTerlarisLoading());
        final mList = await _apiRepository.getProdukTerlarisList();
        emit(ProdukTerlarisLoaded(mList));
      } on NetworkError {
        emit(ProdukTerlarisError("Couldn't fetch data. Is the device online?"));
      }
    });
  }

}